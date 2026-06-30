# Skill: Local skills (`skills.local/`)

## Purpose

Some operational knowledge depends on *this machine* — tools installed locally,
personal credentials, localhost daemons — and should not be committed to a repo
that others clone.

`skills.local/` is the gitignored home for that knowledge. Agents read it
after committed `skills/` on session start.

## When to use it

- The workflow references a tool only you have installed
- Paths or credentials are machine-specific
- You want agent knowledge without polluting the public/shared repo history

## When NOT to use it

- Knowledge that every collaborator needs → put it in committed `skills/`
- One-off scratch notes → `working/`
- Durable project truth → `STATUS.md` or `docs/`

## Convention

```
skills/           committed — repo-specific, travels with git
skills.local/     gitignored — machine-local; README.md is the only committed signpost
```

On session start:

1. Read committed skills in `skills/` (if any).
2. If `skills.local/` contains other `*.md` files, read those too.
3. Skip any skill whose prerequisites are missing — do not error.

See `skills.local/README.md` for the full rules.

## Expected outputs

Agents should briefly note which local skills they loaded (names only), or
continue silently when `skills.local/` is empty or absent.

## Caveats

- Local skills are invisible to teammates unless they install the same files.
- Cross-repo tools may provide an installer that symlinks skills here; that
  installer is optional and machine-specific.
