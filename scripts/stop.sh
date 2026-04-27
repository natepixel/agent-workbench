#!/usr/bin/env bash
set -euo pipefail

# Stop the local dev server started by ./scripts/dev.sh for the current branch.
#
# Resolution order:
#   1. If scripts/dev.repo.sh defines repo_dev_stop(), call it.
#   2. Otherwise, kill every PID listed in DEV_PIDS from the branch state file.
#
# After stopping, the branch state file is removed.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
STATE_DIR="${REPO_ROOT}/working/dev-state"
REPO_HOOK="${SCRIPT_DIR}/dev.repo.sh"

current_branch() {
  git -C "${REPO_ROOT}" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "no-git"
}

safe_branch_name() {
  current_branch | tr '/:' '__'
}

state_file="${STATE_DIR}/$(safe_branch_name).env"

if [[ ! -f "${state_file}" ]]; then
  echo "No dev state for branch $(current_branch). Nothing to stop."
  exit 0
fi

# shellcheck disable=SC1090
source "${state_file}"

stopped_via_hook=0
if [[ -f "${REPO_HOOK}" ]]; then
  # shellcheck disable=SC1090
  source "${REPO_HOOK}"
  if declare -F repo_dev_stop >/dev/null; then
    echo "Calling repo_dev_stop() from scripts/dev.repo.sh"
    repo_dev_stop
    stopped_via_hook=1
  fi
fi

if [[ "${stopped_via_hook}" -eq 0 ]]; then
  if [[ -n "${DEV_PIDS:-}" ]]; then
    for pid in ${DEV_PIDS}; do
      if kill -0 "${pid}" 2>/dev/null; then
        echo "Stopping PID ${pid}"
        kill "${pid}" || true
      fi
    done
  else
    echo "No DEV_PIDS in state and no repo_dev_stop() defined; nothing to kill."
  fi
fi

rm -f "${state_file}"
echo "Cleared ${state_file}"
