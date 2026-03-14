#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
STATE_DIR="${REPO_ROOT}/working/dev-state"
# Branch-local dev state is written by ./scripts/dev.sh after repo_dev_start() returns.
# This state is script-managed and stored under working/dev-state/.

current_branch() {
  git -C "${REPO_ROOT}" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "no-git"
}

safe_branch_name() {
  current_branch | tr '/:' '__'
}

state_file="${STATE_DIR}/$(safe_branch_name).env"

echo "Repo: ${REPO_ROOT}"
echo "Branch: $(current_branch)"
echo "Commit: $(git -C "${REPO_ROOT}" rev-parse --short HEAD 2>/dev/null || echo "n/a")"

if git -C "${REPO_ROOT}" diff --quiet 2>/dev/null; then
  echo "Working tree: clean"
else
  echo "Working tree: dirty"
fi

if [[ -f "${state_file}" ]]; then
  # shellcheck disable=SC1090
  source "${state_file}"
  echo "Dev state file: ${state_file}"
  [[ -n "${STARTED_AT:-}" ]] && echo "Last started: ${STARTED_AT}"
  [[ -n "${APP_PORT:-}" ]] && echo "APP_PORT: ${APP_PORT}"
  [[ -n "${API_PORT:-}" ]] && echo "API_PORT: ${API_PORT}"
  [[ -n "${WEB_PORT:-}" ]] && echo "WEB_PORT: ${WEB_PORT}"
  [[ -n "${DEV_URL:-}" ]] && echo "DEV_URL: ${DEV_URL}"
else
  echo "Dev state file: none"
fi

branch_note="${REPO_ROOT}/working/status/$(safe_branch_name).md"
if [[ -f "${branch_note}" ]]; then
  echo "Branch status note: ${branch_note}"
else
  echo "Branch status note: none"
fi

if [[ -f "${REPO_ROOT}/.env" ]]; then
  echo ".env: present"
else
  echo ".env: missing"
fi
