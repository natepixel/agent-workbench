# Skill: Showboat and Rodney Workflow

## Purpose
Capture a visible demonstration of a requested UI fix or behavior change.

## When to use it
- the user wants visual proof of a fix
- a screenshot or browser walkthrough would help
- a before/after comparison is valuable

## Recommended pattern
1. start local dev with:
   ```bash
   ./scripts/dev.sh
   ```
2. confirm status with:
   ```bash
   ./scripts/status.sh
   ```
3. use the relevant browser automation / screenshot tooling for the repo
4. save resulting screenshots or notes under `working/`
5. summarize findings in a short note or branch status update

## Important principle
The user should not have to remember the exact workflow.
If the repo develops stable showboat/rodney commands, document them here.
