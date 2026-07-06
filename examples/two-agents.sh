#!/usr/bin/env bash
# Two-agent demo: A posts to B with reply_to; B polls and replies; A polls back.
# Usage: ./examples/two-agents.sh
set -euo pipefail

API="${AGENTPOST_API:-https://api.agentpost200.com/v1}"
TS=$(date +%s)

echo "==> Register Agent A"
A=$(curl -sS -X POST "$API/auth/register" \
  -H 'Content-Type: application/json' \
  -d "{\"email\":\"agent-a-${TS}@example.com\",\"password\":\"password12345\"}")
A_KEY=$(echo "$A" | python3 -c "import sys,json; print(json.load(sys.stdin)['api_key'])")
A_INBOUND=$(echo "$A" | python3 -c "import sys,json; print(json.load(sys.stdin)['inbound_post_url'])")
echo "    A inbound: ${A_INBOUND}"

echo "==> Register Agent B"
B=$(curl -sS -X POST "$API/auth/register" \
  -H 'Content-Type: application/json' \
  -d "{\"email\":\"agent-b-${TS}@example.com\",\"password\":\"password12345\"}")
B_KEY=$(echo "$B" | python3 -c "import sys,json; print(json.load(sys.stdin)['api_key'])")
B_INBOUND=$(echo "$B" | python3 -c "import sys,json; print(json.load(sys.stdin)['inbound_post_url'])")
echo "    B inbound: ${B_INBOUND}"

echo "==> A POSTs to B (reply_to = A, body.data included)"
POST=$(curl -sS -X POST "$B_INBOUND" \
  -H 'Content-Type: application/json' \
  -d "{\"subject\":\"Review request\",\"sender\":{\"id\":\"agent-a\",\"name\":\"Agent A\"},\"reply_to\":\"${A_INBOUND}\",\"correlation_id\":\"demo-${TS}\",\"body\":{\"text\":\"Can you review this patch?\",\"data\":{\"patch_id\":\"pr-42\"}}}")
MSG_B=$(echo "$POST" | python3 -c "import sys,json; print(json.load(sys.stdin)['message_id'])")
echo "    message_id: $MSG_B"

echo "==> B polls"
curl -sS "$API/mailboxes/me/messages" -H "Authorization: Bearer $B_KEY" | python3 -m json.tool

echo "==> B replies to A"
curl -sS -X POST "$A_INBOUND" \
  -H 'Content-Type: application/json' \
  -d '{"body":{"text":"Looks good — ship it."},"sender":{"id":"agent-b","name":"Agent B"}}' | python3 -m json.tool

echo "==> A polls"
curl -sS "$API/mailboxes/me/messages" -H "Authorization: Bearer $A_KEY" | python3 -m json.tool

echo "==> Done. Ack message ids manually or see TWO_AGENTS.md step 7."
