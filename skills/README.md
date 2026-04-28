# skills/

This folder contains committed, repo-specific operational skills.

A skill is useful when it:
- helps humans or AIs repeatedly operate in this repo
- captures a recurring workflow
- documents repo-specific debugging or inspection steps
- does not need to be production code

## What belongs here

Put committed, repeatable, repo-relevant operational knowledge here.

Examples:
- how to debug the local API
- how to capture visual evidence of a UI change
- how to run a recurring operational workflow
- how to inspect deploy state
- how to perform repo-specific maintenance tasks

## What does not belong here

Do not use `skills/` for temporary experiments, one-off debugging notes, or branch-local scratch work.
Those belong in `working/`.

## Promotion rule

Draft skills may begin in `working/`.
Once they are proven useful, promote them into `skills/`.

## Suggested format

Each skill should explain:
- purpose
- when to use it
- commands or steps
- expected outputs
- caveats

## Example skills in this template
- `local-api-debugging.md`
- `visual-evidence.md`

These are starter examples. Replace them with skills relevant to your repo as
soon as the template is forked.
