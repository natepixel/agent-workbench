# working/status/

Put branch-specific status notes here.

## Filename convention

Branch status notes live in this folder and should use the **safe branch filename** so that `scripts/status.sh` can find them automatically.

Rule:
- start with the git branch name
- replace `/` with `__`
- replace `:` with `__`
- add `.md`

Examples:
- `main` → `main.md`
- `dev` → `dev.md`
- `feature/add-auth` → `feature__add-auth.md`
- `bugfix:oauth` → `bugfix__oauth.md`

If you want `scripts/status.sh` to detect the branch note automatically, use this filename convention.

## Suggested contents

- date
- branch
- current goal
- last meaningful commit(s)
- current status
- blockers
- next step
