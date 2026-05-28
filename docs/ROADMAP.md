# Roadmap

Candidate improvements for this template. **Review each item before implementing — these are proposals, not commitments. Confirm the problem is real and the fix is worth the surface area it adds.**

## Prevent accidental pushes back to the template

**Context.** Discovered 2026-05-23 while starting `network-setup` from this template. A plain `git clone` of `agent-workbench` carries the template's `origin` remote into the new project, so the first `git push` would land project commits in the public template repo. The repo is already marked `isTemplate: true` on GitHub, so the safe workflow exists — it's just not documented anywhere a new user or AI assistant would see it.

`network-setup` only avoided a leak because the operator caught the misdirected `origin` before pushing.

**Candidate fixes** (review before implementing — confirm each is actually needed):

1. **Document the start-a-new-project recipe in `README.md`.**

   The recommended entrypoint:

   ```bash
   gh repo create my-project --template natepixel/agent-workbench --private --clone
   ```

   Plus a one-line UI alternative (the "Use this template" button on GitHub). This alone may close the hole — if every adopter uses the template-aware workflow, items 2 and 3 are unnecessary.

2. **Add `scripts/detach-from-template.sh`** for the case where someone cloned directly anyway.

   - confirms current origin is `natepixel/agent-workbench`
   - renames origin → upstream (preserves the link for future template merges)
   - prompts for new repo name + visibility
   - calls `gh repo create --source=. --remote=origin --push`

   This automates the exact recovery sequence used by hand for `network-setup`. Useful even if (1) is in place, because it documents the recovery path.

3. **(Optional) First-run tripwire in `scripts/dev.sh`** that warns if `origin` still points at `agent-workbench` AND the README's project title is still "Agent Workbench". Soft check, easy to silence. Probably overkill if (1)+(2) land — flagged here for completeness.

**Open question for review:** is (1) sufficient on its own? If template adopters reliably reach for `gh repo create --template`, the rest is belt-and-suspenders. The detach script earns its place mostly as recovery documentation, not as a routine tool.
