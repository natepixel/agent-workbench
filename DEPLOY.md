# DEPLOY

This template repo does not define a real deployment model for itself. When you use this repo as a starter, replace or adapt this file to describe the deployment model for the new repo. The checklist below is for that downstream project.

## Purpose
Document how deployment works for this repo.

This template is designed to support multiple deployment models:
- local-only
- private internal app
- public app
- docs/knowledge repo with no deploy
- branch-preview capable app

## Default expectations
When applicable, prefer:
- `main` as production
- `dev` as shared development environment
- feature branches deployable by push when practical

## For this template repo
This repo is primarily a template and knowledge/workflow repo.
It does not require a public deploy.

## Deployment checklist for new repos
Update this file to answer:

1. Is there a production deploy?
2. Is there a dev/staging deploy?
3. Can feature branches deploy automatically?
4. What triggers deployment?
5. Where are deployment secrets stored?
6. How do you inspect the deployed status of a branch?
7. What are the rollback steps?
8. What minimum tests must pass before deployment?

## CI/CD note
When possible, automate deploys through GitHub Actions or another documented CI system.
