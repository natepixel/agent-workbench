# working/memory/

Persistent agent scratch — facts, conventions, or context an agent wants to
remember within or across sessions.

## What this is

When a coding agent (Claude Code, Cursor, Codex, etc.) wants to "remember"
something that does not belong in `STATUS.md` (curated project truth) or
`skills/` (durable workflows), write it here.

## Rules

- This folder is gitignored except for this `README.md`.
- Anything in here is the agent's working memory, not project truth.
- Keep notes short and dated. One file per topic is fine.
- If a memory note proves repeatedly useful, **promote it**:
  - operational workflow → `skills/`
  - project-orienting fact → `STATUS.md` or `docs/`
  - decision worth preserving → `docs/decisions/`

## Why this folder exists

Without a designated location, agents tend to invent `memory.md`, `notes.md`,
or `CLAUDE-notes.md` at the repo root. This folder gives them a legitimate
place that does not pollute durable docs and stays out of git history.

## Relationship to other "status-like" files

- `STATUS.md` (root) — curated project truth, human-authored.
- `working/status/<branch>.md` — branch-scoped status notes for ongoing work.
- `working/memory/` — agent-managed memory, not project truth.

These are intentionally separate: each has different write semantics and a
different audience.
