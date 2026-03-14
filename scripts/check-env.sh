#!/usr/bin/env bash
set -euo pipefail

# Validates that every non-comment key listed in .env.example exists in .env.
# This script checks presence, not correctness of values.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

if [[ ! -f "${REPO_ROOT}/.env.example" ]]; then
  echo "Missing .env.example"
  exit 1
fi

if [[ ! -f "${REPO_ROOT}/.env" ]]; then
  echo "Missing .env"
  echo "Create it locally and ensure it contains every key listed in .env.example."
  exit 1
fi

missing=0
while IFS= read -r line; do
  [[ -z "${line}" ]] && continue
  [[ "${line}" =~ ^# ]] && continue
  [[ "${line}" != *=* ]] && continue
  key="${line%%=*}"
  [[ -z "${key}" ]] && continue

  if ! grep -q "^${key}=" "${REPO_ROOT}/.env"; then
    echo "Missing key in .env: ${key}"
    missing=1
  fi
done < "${REPO_ROOT}/.env.example"

if [[ "${missing}" -eq 1 ]]; then
  exit 1
fi

echo ".env looks structurally complete against .env.example"
