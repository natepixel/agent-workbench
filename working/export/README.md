# working/export/

Output directory for **shareable code bundles** produced by [`scripts/export.sh`](../../scripts/export.sh).

## Purpose

When you want another AI (or a human) to review **what would be pushed to GitHub** — without `node_modules`, virtualenvs, `.env`, build artifacts, or other gitignored paths — run:

```bash
./scripts/export.sh
```

from the repository root. The script creates a timestamped `.zip` of the **committed** tree (`git archive HEAD`) and writes it here.

## What gets included

- Only files that are **committed** in the current `HEAD`. Uncommitted work is not in the zip unless you commit or stash it elsewhere first.

## What stays out

- Anything gitignored (dependencies, local env, `working/dev-state/`, etc.)
- The `.git` directory (smaller archive, no history)

## Files in this folder

- **`README.md`** (this file) is committed.
- **Generated `.zip` files** are gitignored — safe to delete anytime.

After exporting, you can attach the zip to an external AI session together with a handoff from [`working/ask-ai/`](../ask-ai/).
