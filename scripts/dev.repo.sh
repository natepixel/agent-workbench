#!/usr/bin/env bash

# Repo-specific local development hook for ./scripts/dev.sh
#
# Humans should normally run:
#   ./scripts/dev.sh        # start
#   ./scripts/stop.sh       # stop
#
# This file is for repo-specific startup/shutdown behavior.
#
# Expected model:
# - dev.sh handles repo root detection, .env loading, branch/worktree-aware state,
#   and common environment setup.
# - this file defines repo-specific startup logic (and optional shutdown logic).
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
# - start the needed local process(es), capture their PIDs
# - export DEV_PIDS as a space-separated list of PIDs to manage
# - print useful status output
# - optionally export refined local URL values if the repo needs them
# - optionally define repo_dev_stop() for custom shutdown
#
# Avoid making users run this file directly unless they are actively developing
# the local startup workflow itself.
#
# Persistence note:
# After repo_dev_start() returns, ./scripts/dev.sh writes branch-local dev state.
# Values set or exported here (for example APP_PORT, API_PORT, WEB_PORT, DEV_URL,
# DEV_PIDS) are persisted and later surfaced by ./scripts/status.sh and
# ./scripts/stop.sh.

repo_dev_start() {
  echo "Repo-specific dev hook not customized yet."
  echo "Typical tasks for this function:"
  echo "- install or verify dependencies"
  echo "- run migrations"
  echo "- start backend/frontend processes in the background"
  echo "- export DEV_PIDS so ./scripts/stop.sh can clean up"
  echo "- set DEV_URL based on chosen ports"
  echo ""
  echo "Example:"
  echo "  APP_PORT=\${APP_PORT:-8000}"
  echo "  export APP_PORT"
  echo "  DEV_URL=http://127.0.0.1:\${APP_PORT}"
  echo "  export DEV_URL"
  echo "  # uvicorn app:app --port \"\${APP_PORT}\" &"
  echo "  # DEV_PIDS=\$!"
  echo "  # export DEV_PIDS"
}

# Optional shutdown hook for ./scripts/stop.sh.
# If this function is not defined, stop.sh falls back to killing every PID
# listed in DEV_PIDS from the branch state file.
#
# repo_dev_stop() {
#   # Custom shutdown logic, e.g.:
#   # docker compose -f local.yml down
#   # pkill -f "my-dev-server" || true
# }
