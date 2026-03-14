# working/

This folder is for temporary, AI-friendly, non-durable project work.

Examples:
- one-off debug scripts
- investigation notes
- comparison docs
- screenshots
- AI handoff bundles
- branch-specific status notes
- temporary experiments

## Rule of thumb

- temporary = `working/`
- durable = top-level docs, `docs/`, `skills/`, `scripts/`, `tests/`

## What is tracked vs ignored

Most files under `working/` are gitignored.

The template intentionally keeps a small committed structure here so humans and AIs have standard places to work:
- `ask-chatgpt/` for external AI handoff templates
- `status/` for branch-specific status notes
- `notes/` for lightweight committed working notes
- this `README.md`

All other files under `working/` should be assumed temporary unless the repo intentionally changes that policy.

Note: `working/dev-state/` is a script-managed, gitignored path used for branch-local development state. It is not part of the committed `working/` structure and should usually be left alone unless you are debugging the repo scripts themselves.

## Suggested subfolders

- `ask-chatgpt/` — structured external AI handoffs
- `status/` — branch-specific status notes
- `notes/` — temporary working notes

Use the safe branch filename convention described in `working/status/README.md`.
