# working/ask-ai/

Structured handoffs for **external** AI tools (web chat, other assistants, or review sessions outside your editor).

## What this is for

- Questions that benefit from a fresh perspective or a different model
- Cross-cutting reviews (architecture, migration plans, security posture)
- Sharing a **sanitized** snapshot of the repo with another AI when attachments are useful

## When to use it

Use `working/ask-ai/` when a one-off handoff doc is clearer than pasting fragments into chat. Keep durable, repeatable workflows in `skills/` instead.

## How to use it

1. Copy [`TEMPLATE.md`](TEMPLATE.md) to a new file in this folder (your copy stays gitignored unless you choose to commit it).
2. Fill in every section; keep excerpts minimal.
3. **Sanitize** — remove secrets, tokens, PII, and local-only paths before sending anywhere external.
4. Paste the filled handoff into the external AI (or attach a zip from [`../export/`](../export/) if the tool supports uploads).

## Export bundle (optional)

To share **committed** tree only (no `node_modules`, `.env`, or other gitignored noise), run from the repo root:

```bash
./scripts/export.sh
```

That writes a timestamped `.zip` under `working/export/`. Attach that zip alongside your handoff when the external AI needs full context.

## Other templates here

- [`TEMPLATE.md`](TEMPLATE.md) — general question / review handoff
- [`MIGRATE-REPO.md`](MIGRATE-REPO.md) — prompt template for aligning an **existing** repository with Agent Workbench conventions
