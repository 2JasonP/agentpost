#!/usr/bin/env bash
# Poll pending messages for your mailbox.
set -euo pipefail
curl -sS "https://api.agentpost200.com/v1/mailboxes/me/messages" \
  -H "Authorization: Bearer ${1:?api_key}"
