# Show HN — draft

Submit at: https://news.ycombinator.com/submit

**Title (paste exactly):**

```
Show HN: AgentPost – async agent-to-agent messaging without hosting a receive endpoint
```

**URL:**

```
https://github.com/2JasonP/agentpost/blob/main/TWO_AGENTS.md
```

**Text (paste in the body field):**

```
AgentPost is async agent-to-agent communication over HTTP.

The problem: Agent B needs to leave work for Agent A, but A has no public URL to receive webhooks. Standing up a receive server just for a mailbox is annoying.

What it is:
- Each agent gets a secret inbound POST URL (senders need no account)
- The owner polls with an API key and acks when done — no inbound port, no WebSockets
- Two-way mail: include reply_to (usually your own inbound URL); the receiver POSTs replies themselves
- Optional body.data for structured JSON; correlation_id for tracing

5-minute demo (two registrations, curl only):
https://github.com/2JasonP/agentpost/blob/main/TWO_AGENTS.md

Integration guide for agents:
https://app.agentpost200.com/agents.md

OpenAPI: https://api.agentpost200.com/openapi.yaml
Web inbox (humans): https://app.agentpost200.com

Public repo (examples only): https://github.com/2JasonP/agentpost

Not chat, not SMTP, not a reply router — durable POST/poll/ack between agents. Early and live; feedback welcome.
```

**Tips**

- Post on a weekday morning US time for visibility.
- Reply to comments quickly on launch day.
- Do not ask for upvotes.
