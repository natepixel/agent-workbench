# Agent Workbench

A starter repo for humans and coding agents working together.

This repo is intentionally dual-purpose:

1. It is a **template** you can copy to start new repositories.
2. It is also the **living workspace** where you improve the template itself.

**Requirements:** Bash, Git, and Python 3 (used by `scripts/dev.sh` for port detection when no port is set).

## How to use this template

Use this repo as a starter: clone or copy it into a new project folder, then replace example docs and skills with project-specific ones. Adapt `DEPLOY.md`, `STATUS.md`, `.env.example`, and `scripts/dev.repo.sh` for your project.

This is a starter/workbench template; some scripts are scaffolding and are meant to be adapted per repo.

## Principles

- One-command local development: `./scripts/dev.sh`
- Strong AI orientation via `AGENTS.md`
- Clear project truth via `README.md`, `STATUS.md`, and `DEPLOY.md`
- Temporary AI clutter belongs in `working/`
- Durable operational knowledge belongs in `skills/`
- Secrets stay out of git
- Testing is considered from the start
- Branch-specific status should be easy to inspect
- The repo should help both humans and AIs quickly understand how to work

## Folder overview

- `AGENTS.md` — how AIs should understand and operate in the repo
- `STATUS.md` — high-level current status
- `DEPLOY.md` — deployment model and expectations
- `docs/decisions/` — durable design decisions
- `skills/` — committed operational skills for this repo
- `scripts/` — stable project scripts
- `tests/` — canonical testing ladder and unit/integration test area
- `e2e/` — end-to-end and Playwright-style testing area
- `working/` — scratch space, AI handoffs, temporary notes, branch status

## Standard commands

Use these entrypoints consistently:

```bash
./scripts/check-env.sh
./scripts/dev.sh
./scripts/stop.sh
./scripts/status.sh
./scripts/export.sh
```

Notes:
- `./scripts/dev.sh` is the only standard local development entrypoint
- `./scripts/stop.sh` cleans up the dev server started by `dev.sh` for the current branch
- `./scripts/export.sh` builds a `.zip` of the committed tree (no gitignored deps) into `working/export/` — useful for external AI review; see `working/ask-ai/`
- branch status notes belong in `working/status/`
- temporary AI, handoff, and debug work belongs in `working/`
- durable repo-specific operational knowledge belongs in `skills/`

## This repo improves itself

Use this repo to evolve the template. The normal workflow is:

1. capture current thinking in `STATUS.md`
2. use `working/` for drafts and experiments
3. promote stable patterns into committed docs, scripts, or `skills/`
4. when the template improves, copy it forward into new repos

## Getting started

1. **First run:** Copy `.env.example` to `.env` and add real values as needed (`cp .env.example .env`). Then you can run `./scripts/check-env.sh`.
2. Use this repo as a starter by cloning or copying it into a new project folder, then updating the core docs and scripts for that project.
3. Update:
   - `README.md`
   - `AGENTS.md`
   - `STATUS.md`
   - `DEPLOY.md`
   - `.env.example`
4. Customize:
   - `scripts/dev.repo.sh`
   - `scripts/check-env.sh`
   - CI workflow
   - test commands
5. Add project-specific skills in `skills/`

## Root cleanliness rule

The repo root should contain only durable, orienting, high-signal files and folders.
Keep the repo root limited to a small set of orienting files; put other durable documentation such as architecture notes, decisions, and runbooks under `docs/`.
Temporary writeups, experiments, and one-off scripts belong in `working/`.
