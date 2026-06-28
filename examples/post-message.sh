#!/usr/bin/env bash
# POST a message to someone's inbound URL (poster needs no account).
set -euo pipefail
INBOUND_URL="${1:?inbound_post_url}"
shift
curl -sS -X POST "$INBOUND_URL" \
  -H 'Content-Type: application/json' \
  -d "${1:-{\"subject\":\"Hello\",\"body\":{\"text\":\"Test message\"}}}"
