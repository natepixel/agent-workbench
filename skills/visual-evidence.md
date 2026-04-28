# Skill: Visual Evidence of UI or Behavior Changes

## Purpose
Capture visible proof of a UI fix or behavior change so a reviewer (human or AI) can confirm it without re-running the workflow themselves.

## When to use it
- the change is visual and a screenshot or short walkthrough is faster than describing it
- a before/after comparison would help review
- you want to attach evidence to a PR, handoff, or external AI review

## Recommended pattern
1. start local dev:
   ```bash
   ./scripts/dev.sh
   ```
2. confirm it's running:
   ```bash
   ./scripts/status.sh
   ```
3. exercise the affected flow in the browser (or whichever client matters for this repo)
4. capture screenshots — full page for context, cropped for the specific change
5. save artifacts under `working/` (e.g. `working/<branch>/screenshots/`) and reference them in the branch status note or handoff doc

## Notes
- name files with the date and a short description so a future reader can scan them: `2026-04-27-checkout-button-fix.png`
- if a real before/after is meaningful, capture both and put them side-by-side
- screenshots may contain local data — sanitize before sharing externally
- if your repo adopts a specific tool for this (Playwright traces, a custom screenshot script, etc.), document it here and it stops being a generic skill
