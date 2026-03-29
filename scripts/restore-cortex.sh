#!/usr/bin/env bash
set -euo pipefail

SANDBOX_NAME="cortex"

if [ $# -ne 1 ]; then
  echo "Usage: $0 /full/path/to/openclaw-data-backup.tgz"
  exit 1
fi

ARCHIVE="$1"

if [ ! -f "${ARCHIVE}" ]; then
  echo "Archive not found: ${ARCHIVE}"
  exit 1
fi

echo "Upload this archive into the sandbox as /tmp/openclaw-data-backup.tgz, then run:"
echo
echo "nemoclaw ${SANDBOX_NAME} connect"
echo "rm -rf /sandbox/.openclaw-data"
echo "tar -xzf /tmp/openclaw-data-backup.tgz -C /sandbox"
echo "exit"
