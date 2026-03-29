#!/usr/bin/env bash
set -euo pipefail

SANDBOX_NAME="cortex"
STAMP="$(date +%F-%H%M%S)"
HOST_DIR="${HOME}/data/openclaw/cortex/backups"
HOST_ARCHIVE="${HOST_DIR}/openclaw-data-${STAMP}.tgz"

mkdir -p "${HOST_DIR}"

echo "==> Creating archive inside sandbox"
nemoclaw "${SANDBOX_NAME}" connect <<'INNER'
set -e
tar -czf /tmp/openclaw-data-backup.tgz -C /sandbox .openclaw-data
exit
INNER

echo
echo "Backup archive created inside sandbox at:"
echo "  /tmp/openclaw-data-backup.tgz"
echo
echo "Now copy it out of the sandbox to:"
echo "  ${HOST_ARCHIVE}"
echo
echo "After copying it out, you can optionally remove the temp file from the sandbox."
