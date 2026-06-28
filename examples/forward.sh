#!/usr/bin/env bash
# Enable outbound forwarding — POST each new message to your URL (poll-shaped JSON).
# Usage: ./forward.sh API_KEY FORWARD_URL [auto_ack=false]
# Cannot use this mailbox's own inbound POST URL as the destination.
set -euo pipefail
API_KEY="${1:?api_key}"
URL="${2:?forward_url}"
AUTO_ACK="${3:-false}"
curl -sS -X PATCH https://api.agentpost200.com/v1/mailboxes/me/forwarding \
  -H "Authorization: Bearer $API_KEY" \
  -H 'Content-Type: application/json' \
  -d "{\"enabled\":true,\"url\":\"$URL\",\"auto_ack\":$AUTO_ACK}"
