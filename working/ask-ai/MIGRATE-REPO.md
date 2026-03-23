# Migrate an existing repository (Ask AI prompt template)

Copy this file, fill in the bracketed sections, sanitize, then paste into an external AI. Optionally attach a zip from `./scripts/export.sh` run **in the target repo** so the AI sees the committed tree without gitignored clutter.

---

## Question

Help me evolve an existing repository toward the **Agent Workbench** conventions: clear AI orientation, scratch vs durable docs, branch-aware dev scripts, and a testing ladder. Produce **[migration plan | concrete file list | patch-style instructions]** as specified below.

## Repository context

- **Repo name / purpose:**
- **Primary stack:** (languages, frameworks, package managers)
- **How people run it locally today:**
- **Where docs live today:** (README only, wiki, `docs/`, scattered, etc.)
- **Link or path to this template for reference:** (e.g. clone or read `AGENTS.md` from `natepixel/agent-workbench`)

## Current state (honest snapshot)

- **What works well:**
- **What is messy for humans or AIs:** (unclear entrypoints, clutter at repo root, no place for scratch work, etc.)
- **Secrets / env:** how `.env` is handled today

## What must not change

- **Invariants:** (public APIs, prod behavior, team agreements)
- **Files or dirs that are off-limits:**

## Conventions to adopt (from Agent Workbench)

Prioritize in this order unless you say otherwise:

1. **`AGENTS.md`** — how AIs should work in *this* repo (read order, scripts contract, `working/` vs `skills/`, secrets).
2. **`working/`** — scratch, branch status (`working/status/` with safe branch filenames), optional `working/export/` for shareable zips.
3. **`skills/`** — committed, repeatable operational how-tos (not production code).
4. **Scripts** — stable `./scripts/dev.sh` entrypoint; repo-specific logic in `scripts/dev.repo.sh`.
5. **Testing ladder** — document smoke → unit → integration → e2e in `tests/README.md` (and `e2e/` when applicable).
6. **Top-level vs `docs/`** — keep root lean; put architecture, decisions, runbooks under `docs/`.

## Deliverable I want

Check one or more:

- [ ] Phased migration plan (small PRs, low risk first)
- [ ] Ordered checklist of new/changed files
- [ ] Copy-paste-ready snippets for `AGENTS.md`, `README.md`, and `scripts/dev.repo.sh` stubs
- [ ] Suggested `.gitignore` updates for `working/` and exports

## AI safety note

Do not include real secrets, tokens, or PII. Use placeholders and describe where secrets should live (`.env.example` + local `.env` only).
