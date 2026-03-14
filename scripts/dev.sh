#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WORKING_DIR="${REPO_ROOT}/working"
STATE_DIR="${WORKING_DIR}/dev-state"
REPO_HOOK="${SCRIPT_DIR}/dev.repo.sh"

mkdir -p "${STATE_DIR}"

load_env() {
  if [[ -f "${REPO_ROOT}/.env" ]]; then
    set -a
    # shellcheck disable=SC1091
    source "${REPO_ROOT}/.env"
    set +a
  fi
}

current_branch() {
  git -C "${REPO_ROOT}" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "no-git"
}

safe_branch_name() {
  current_branch | tr '/:' '__'
}

branch_state_file() {
  echo "${STATE_DIR}/$(safe_branch_name).env"
}

find_free_port() {
  python3 - <<'PY'
import socket
with socket.socket() as s:
    s.bind(("127.0.0.1", 0))
    print(s.getsockname()[1])
PY
}

read_state() {
  local state_file
  state_file="$(branch_state_file)"
  if [[ -f "${state_file}" ]]; then
    # shellcheck disable=SC1090
    source "${state_file}"
  fi
}

write_state() {
  local state_file
  state_file="$(branch_state_file)"
  cat > "${state_file}" <<EOF
BRANCH_NAME=$(current_branch)
STARTED_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
APP_PORT=${APP_PORT:-}
API_PORT=${API_PORT:-}
WEB_PORT=${WEB_PORT:-}
PID_FILE=${PID_FILE:-}
DEV_URL=${DEV_URL:-}
EOF
}

default_dev_url() {
  if [[ -n "${DEV_URL:-}" ]]; then
    echo "${DEV_URL}"
  elif [[ -n "${WEB_PORT:-}" ]]; then
    echo "http://127.0.0.1:${WEB_PORT}"
  elif [[ -n "${APP_PORT:-}" ]]; then
    echo "http://127.0.0.1:${APP_PORT}"
  elif [[ -n "${API_PORT:-}" ]]; then
    echo "http://127.0.0.1:${API_PORT}"
  else
    echo ""
  fi
}

run_repo_hook() {
  if [[ -f "${REPO_HOOK}" ]]; then
    # shellcheck disable=SC1090
    source "${REPO_HOOK}"
    if declare -F repo_dev_start >/dev/null; then
      repo_dev_start
      return 0
    fi
  fi
  echo "No repo-specific dev hook found. Add scripts/dev.repo.sh with repo_dev_start()."
  return 0
}

main() {
  load_env
  read_state

  APP_PORT="${APP_PORT:-}"
  API_PORT="${API_PORT:-}"
  WEB_PORT="${WEB_PORT:-}"

  if [[ -z "${APP_PORT}" && -z "${API_PORT}" && -z "${WEB_PORT}" ]]; then
    APP_PORT="$(find_free_port)"
  fi

  if [[ -z "${DEV_URL:-}" ]]; then
    DEV_URL="$(default_dev_url)"
  fi

  echo "Repo root: ${REPO_ROOT}"
  echo "Branch: $(current_branch)"
  echo "Starting local development via scripts/dev.sh"

  run_repo_hook
  write_state

  echo ""
  echo "Dev startup complete."
  if [[ -n "${DEV_URL}" ]]; then
    echo "Primary URL: ${DEV_URL}"
  fi
  echo "Status: ./scripts/status.sh"
  echo "State: $(branch_state_file)"
}

main "$@"
