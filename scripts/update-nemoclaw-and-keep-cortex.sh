#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/src/nemoclaw-custom"

cd "${REPO_DIR}"

echo "==> Syncing with upstream"
"${REPO_DIR}/scripts/update-from-upstream.sh"

echo "==> Ensuring sandbox exists"
"${REPO_DIR}/scripts/ensure-cortex.sh"

echo "==> Current sandboxes"
openshell sandbox list || true

echo
echo "Update complete."
echo "Normal next step:"
echo "  nemoclaw cortex connect"
