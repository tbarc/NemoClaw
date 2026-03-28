#!/usr/bin/env bash
set -euo pipefail

SANDBOX_NAME="cortex"

if openshell sandbox list 2>/dev/null | awk 'NR>1 {print $1}' | grep -qx "${SANDBOX_NAME}"; then
  echo "Sandbox '${SANDBOX_NAME}' already exists."
else
  echo "Creating sandbox '${SANDBOX_NAME}'..."
  openshell sandbox create --name "${SANDBOX_NAME}"
fi
