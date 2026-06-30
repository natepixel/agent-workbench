# skills.local/

Machine-local skills live here. **Gitignored** — never pushed.

Use this for operational knowledge that depends on tools, paths, or credentials
on *this* machine only. Committed skills in `skills/` travel with the repo;
`skills.local/` does not.

## On session start

After reading committed skills in `skills/`, check whether any `*.md` files
exist here (besides this README). If so, load them. They may reference tools
not installed on every developer's machine — skip silently when prerequisites
are missing.

## Examples of what belongs here

- Personal deploy or SSH shortcuts
- A bridge skill for a localhost daemon you run on your Mac
- Machine-specific debugging hooks

## Installing a local skill

Create or symlink a markdown file here, e.g.:

```bash
ln -sf ~/path/to/skill.md skills.local/my-tool.md
```

Some tools (e.g. Cheshire) provide an installer that symlinks into tracked
repos: `cheshire skill install <repo>`.

## Promotion

If a local skill becomes portable and useful to everyone on the project, rewrite
it without machine-specific paths and promote it to `skills/`.
