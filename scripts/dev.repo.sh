#!/usr/bin/env bash

# Repo-specific local development hook for ./scripts/dev.sh
#
# Humans should normally run:
#   ./scripts/dev.sh
#
# This file is for repo-specific startup behavior.
#
# Expected model:
# - dev.sh handles repo root detection, .env loading, branch/worktree-aware state,
#   and common environment setup.
# - this file defines repo-specific startup logic.
#
# Common values that dev.sh may set before calling into this file include:
# - APP_PORT
# - API_PORT
# - WEB_PORT
# - DEV_URL
# - REPO_ROOT
#
# Preferred pattern:
# - define repo_dev_start()
# - start the needed local process(es)
# - print useful status output
# - optionally export refined local URL values if the repo needs them
#
# Avoid making users run this file directly unless they are actively developing
# the local startup workflow itself.
#
# Persistence note:
# After repo_dev_start() returns, ./scripts/dev.sh writes branch-local dev state.
# Values set or exported here (for example APP_PORT, API_PORT, WEB_PORT, DEV_URL)
# are the values that will be persisted and later shown by scripts such as
# ./scripts/status.sh.

repo_dev_start() {
  echo "Repo-specific dev hook not customized yet."
  echo "Typical tasks for this function:"
  echo "- install or verify dependencies"
  echo "- run migrations"
  echo "- start backend/frontend processes"
  echo "- set DEV_URL based on chosen ports"
  echo ""
  echo "Example:"
  echo "  APP_PORT=${APP_PORT:-8000}"
  echo "  export APP_PORT"
  echo "  DEV_URL=http://127.0.0.1:${APP_PORT}"
  echo "  export DEV_URL"
  echo "  # start your local server here"
}
