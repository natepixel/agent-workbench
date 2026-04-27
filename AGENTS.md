# AGENTS.md

This file helps AI tools like ChatGPT, Cursor, Claude, Codex, and similar assistants understand how to work in this repo.

`AGENTS.md` is the source of truth. Tool-specific entrypoints (such as
`CLAUDE.md` for Claude Code) should be thin pointers that import this file
rather than duplicate it.

## Repo purpose

This repository is a reusable starter template for projects that combine:
- code
- AI collaboration
- durable project documentation
- temporary working artifacts
- branch-aware local development

It is both:
- a base template for new repositories
- a living workspace for improving the template itself

## Read these files first

1. `README.md`
2. `STATUS.md`
3. `DEPLOY.md`
4. `working/README.md`
5. `skills/README.md`
6. `tests/README.md`

## Core operating rules

- Always prefer `./scripts/dev.sh` for local startup.
- Never tell the user to run `dev.repo.sh` directly.
- Treat `scripts/dev.sh` as the stable public entrypoint.
- Use `scripts/dev.repo.sh` only as an internal customization hook.
- Keep the repo root clean.
- Put temporary AI work in `working/`.
- Promote durable workflows into `skills/` or top-level docs.
- Never commit secrets.
- If a secret is needed, document it in `.env.example` and instruct the user to add it to `.env`.

## Scripts contract

### Local development entrypoint

For local development, always use:

```bash
./scripts/dev.sh    # start
./scripts/stop.sh   # stop the server started by dev.sh on this branch
```

Do not run `scripts/dev.repo.sh` directly unless you are actively editing the repo-specific startup logic.

`stop.sh` calls `repo_dev_stop()` if `scripts/dev.repo.sh` defines one; otherwise it kills every PID listed in `DEV_PIDS` from the branch state file. Repo-specific startup hooks should export `DEV_PIDS` so shutdown works cleanly.

### `dev.sh` and `dev.repo.sh`

`scripts/dev.sh` is the stable user-facing entrypoint. It may call `scripts/dev.repo.sh` if that file exists.

Typical responsibilities of `dev.sh`:
- locate repo root
- load `.env` if present
- assign or reuse branch/worktree-local ports
- restart or replace an existing local server for the same branch when appropriate
- set common environment variables
- call repo-specific startup logic
- write dev-state metadata under `working/`

Typical responsibilities of `dev.repo.sh`:
- define how this specific repo starts locally
- optionally perform repo-specific preflight steps
- start one or more local processes
- optionally export values such as local URLs or health check paths

When editing local dev behavior:
- preserve `./scripts/dev.sh` as the stable entrypoint
- put repo-specific logic in `scripts/dev.repo.sh` where possible

### Persisted dev state

After `repo_dev_start()` returns, `./scripts/dev.sh` writes branch-local dev state for the current worktree/branch.

In practice, this means values set or exported by the repo-specific startup hook — such as `APP_PORT`, `API_PORT`, `WEB_PORT`, `DEV_URL`, and `DEV_PIDS` — are the values that get persisted and later surfaced by scripts like `./scripts/status.sh` and consumed by `./scripts/stop.sh`.

If local startup behavior needs different persisted values, set or export them in `repo_dev_start()`.

## Working folders

### `working/`
This is intentionally a scratch/workspace area for:
- AI handoff docs
- temporary notes
- one-time debug scripts
- experiments
- branch-specific status notes
- screenshots and evidence if needed

### `working/` tracking model

`working/` is primarily scratch space and is mostly gitignored.

The template intentionally keeps a small committed structure inside `working/` for repeatable collaboration:
- `working/README.md`
- `working/ask-ai/`
- `working/export/`
- `working/status/`
- `working/memory/` (only `README.md` is committed)
- `working/notes/`

Anything else under `working/` should generally be treated as temporary unless the repo explicitly chooses to commit it.

### Script-managed working paths

Some paths under `working/` are managed by scripts rather than by humans.

In particular:
- `working/dev-state/` is used by repo scripts for branch-local development state
- it is gitignored
- it is not part of the committed working structure
- humans and AI agents should generally not edit it by hand unless they are intentionally debugging the repo scripts

### `working/status/`
Branch-aware status notes live here. See `working/status/README.md` for the
filename convention (used by `scripts/status.sh`) and the recommended
contents.

### `working/memory/`
Designated location for agent-managed memory — facts, conventions, or context
an agent wants to persist across sessions. Gitignored except for its
`README.md`. Use this instead of inventing a `memory.md`, `notes.md`, or
`CLAUDE-notes.md` at the repo root. See `working/memory/README.md` for rules
and the promotion path into `skills/`, `STATUS.md`, or `docs/`.

## Skills model

`skills/` contains committed, repo-specific operational knowledge.

Use a skill when the knowledge:
- is repeatedly useful
- is tightly related to this repo or project domain
- helps a human or AI operate more effectively
- does not need to ship as production code

Draft skills can start in `working/` and later be promoted into `skills/`.

## Testing expectations

Every repo should think about testing from the outset.

See `tests/README.md` for the canonical testing ladder used by this template.

## Secrets policy

- `.env` is local only
- `.env.example` is committed and documents required variables
- do not commit real secrets
- scripts may check for required secrets
- scripts may provision secrets to external systems, but the AI should not need to view the secret values

## Promotion rule

Promote work upward as it stabilizes:
- scratch, experiments, and one-off handoffs -> `working/`
- repeatable repo-specific workflows or operational procedures -> `skills/`
- durable project truth that helps orient the whole repo -> top-level docs
- other durable reference material, decisions, architecture notes, and runbooks -> `docs/` or an appropriate subfolder under `docs/`

Top-level docs should stay limited to a small set of orienting files such as `README.md`, `AGENTS.md`, `STATUS.md`, and `DEPLOY.md`.

## What good AI help looks like in this repo

A good assistant should:
- keep answers concrete
- preserve the conventions in this template
- prefer stable entrypoints
- reduce cognitive load
- avoid creating clutter in durable locations
- help convert vague ideas into clear next actions
