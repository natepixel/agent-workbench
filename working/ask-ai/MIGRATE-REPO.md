# Migrate an Existing Repo (Copy/Paste Prompt)

Use this as a direct prompt for an AI that already has access to your target repository.

Reference template repo:
- https://github.com/natepixel/agent-workbench

Optional but recommended:
- In the target repo, run `./scripts/export.sh` (or equivalent) and attach the generated zip so the AI can inspect committed files without gitignored clutter.

---

## Copy/Paste Prompt

You are working inside an existing repository and should migrate it toward the **Agent Workbench** conventions.

Reference for conventions and examples:
- https://github.com/natepixel/agent-workbench

Goal:
- Adopt a convention-heavy structure that supports humans and coding agents with clear docs, stable script entrypoints, and clean scratch-vs-durable boundaries.

Please do the following:

1) Analyze this repository and identify gaps vs these target conventions:
- Top-level orienting docs: `README.md`, `AGENTS.md`, `STATUS.md`, `DEPLOY.md`
- Tool-specific agent files (e.g. `CLAUDE.md`) as thin pointers to `AGENTS.md` rather than duplicates
- Stable scripts entrypoints under `scripts/`:
  - `./scripts/dev.sh` as the main local dev entrypoint
  - `./scripts/stop.sh` paired with it (kills processes registered as `DEV_PIDS` by `scripts/dev.repo.sh::repo_dev_start()`, or calls `repo_dev_stop()` if defined)
  - `./scripts/status.sh`, `./scripts/check-env.sh`, `./scripts/export.sh`
- `working/` as mostly gitignored scratch space, with committed structure:
  - `working/README.md`
  - `working/ask-ai/TEMPLATE.md`
  - `working/status/README.md`
  - `working/notes/README.md`
  - `working/memory/README.md` (agent-managed memory; the rest is gitignored)
  - optional `working/export/README.md`
- `skills/` for committed, repeatable operational workflows
- `docs/decisions/` for durable design decisions
- `tests/README.md` defining smoke -> unit -> integration -> e2e testing ladder
- `.env.example` documenting required config/secrets (`.env` local-only)

The template also ships a small CI workflow that lints `scripts/*.sh` with `shellcheck` and exercises `check-env.sh`. Adopt it if useful; skip if the target repo has its own CI conventions.

2) Produce:
- A prioritized migration plan (small, low-risk steps first)
- Exact file-by-file changes needed
- New files to add (with full contents)
- Files to rename/move
- `.gitignore` updates needed to enforce the structure

3) Implement the migration directly in this repository:
- Apply the agreed changes
- Keep runtime/business behavior stable unless a change is necessary for convention alignment
- Where the target repo already has files like `AGENTS.md`, `CLAUDE.md`, `STATUS.md`, or a dev script, preserve project-specific content and merge in what's missing rather than overwrite
- Keep repo root clean and high-signal
- Add concise docs/comments where needed

4) After changes:
- Summarize what changed and why
- List follow-up items to customize for this specific repo
- Propose a clear commit message

Constraints:
- Do not commit secrets
- Do not remove existing business logic unless it is clearly obsolete
- Prefer additive, minimal-risk structural/documentation changes first
