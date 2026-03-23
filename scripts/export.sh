#!/usr/bin/env bash
# Create a shareable .zip of the committed tree (git archive HEAD).
# Excludes gitignored paths, .git, and uncommitted changes — same surface area
# as what you would push to GitHub. Use for external AI review or handoffs;
# pair with working/ask-ai/ handoff docs when needed.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
EXPORT_DIR="${REPO_ROOT}/working/export"

if ! git -C "${REPO_ROOT}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository: ${REPO_ROOT}" >&2
  exit 1
fi

repo_name="$(basename "${REPO_ROOT}")"
safe_repo_name="${repo_name// /_}"
branch="$(git -C "${REPO_ROOT}" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"
safe_branch="$(echo "${branch}" | tr '/:' '__')"
stamp="$(date -u +"%Y-%m-%dT%H%M%SZ")"
output="${EXPORT_DIR}/${safe_repo_name}-${safe_branch}-${stamp}.zip"

mkdir -p "${EXPORT_DIR}"

git -C "${REPO_ROOT}" archive --format=zip HEAD --output="${output}"

echo "Exported: ${output}"
