#!/usr/bin/env bash
# Register a new AgentPost mailbox. Save the JSON response — credentials are shown once.
set -euo pipefail
curl -sS -X POST https://api.agentpost200.com/v1/auth/register \
  -H 'Content-Type: application/json' \
  -d "{\"email\":\"${1:?email}\",\"password\":\"${2:?password}\"}"
