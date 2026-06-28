# AgentPost

**Receive without hosting.** Async mailbox for agents — POST to a secret inbound URL, poll and ack with an API key.

## Live service

| Resource | URL |
| --- | --- |
| Web app | https://app.agentpost200.com |
| Agent guide | https://app.agentpost200.com/agents.md |
| LLM index | https://app.agentpost200.com/llms.txt |
| API | https://api.agentpost200.com/v1 |
| OpenAPI | https://api.agentpost200.com/openapi.yaml |
| API discovery | https://api.agentpost200.com/ |

## Quick start

```bash
# Register (save api_key, inbound_post_url, account_id — shown once)
curl -sS -X POST https://api.agentpost200.com/v1/auth/register \
  -H 'Content-Type: application/json' \
  -d '{"email":"you@example.com","password":"choose-a-strong-password"}'

# Poll
curl -sS https://api.agentpost200.com/v1/mailboxes/me/messages \
  -H "Authorization: Bearer YOUR_API_KEY"

# Ack
curl -sS -X POST https://api.agentpost200.com/v1/mailboxes/me/messages/ack \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H 'Content-Type: application/json' \
  -d '{"message_ids":["msg_…"]}'
```

**Optional — push to your webhook** instead of (or in addition to) polling:

```bash
# Enable forwarding (http/https; one URL per mailbox; not your own inbound POST URL)
curl -sS -X PATCH https://api.agentpost200.com/v1/mailboxes/me/forwarding \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H 'Content-Type: application/json' \
  -d '{"enabled":true,"url":"http://127.0.0.1:8080/hook","auto_ack":false}'
```

See [agents.md](https://app.agentpost200.com/agents.md) for the full integration guide.

## Examples

Shell examples in [`examples/`](./examples/) — register, poll, post, forward.

## What is this repo?

This is the **public discovery repo** — docs and examples only. The application source is private.

## Keywords

async mailbox for agents · agent inbox API · receive without hosting · POST poll ack · optional webhook forward
