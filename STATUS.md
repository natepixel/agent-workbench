# STATUS

## What this repo is
A living starter template for repos that combine:
- real project code
- AI collaboration
- durable project documentation
- temporary working artifacts
- branch-aware local development

## Current template goals
- standardize top-level repo conventions
- standardize `working/` as safe scratch space
- standardize `skills/` as committed operational knowledge
- standardize one-command local startup via `./scripts/dev.sh`
- standardize branch-aware status and repo status visibility
- standardize testing expectations from the beginning

## Current strengths
- clear AI orientation pattern
- branch-aware local workflow model
- stable script entrypoints
- explicit secret-handling expectations
- ready for self-hosted evolution

## Open questions to revisit
- how smart should universal `dev.sh` become before repo-specific overrides take over?
- should there be a shared shell helper library across all repos?
- should `skills/` eventually include metadata files for richer agent discovery?
- should there be a second template specialized for FastAPI + React/Vite?

## Next likely improvements
- make `scripts/status.sh` smarter about deployments
- add optional port registry and restart behavior in `scripts/dev.sh`
- add a stronger CI scaffold
- add template copier / bootstrap script
- add sample skill metadata format if useful
