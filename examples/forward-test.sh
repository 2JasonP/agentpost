#!/usr/bin/env bash
# Send a synthetic test forward to the saved URL (does not ack real messages).
# Usage: ./forward-test.sh API_KEY
set -euo pipefail
curl -sS -X POST https://api.agentpost200.com/v1/mailboxes/me/forwarding/test \
  -H "Authorization: Bearer ${1:?api_key}"
