#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/src/nemoclaw-custom"
BRANCH="${1:-main}"

cd "${REPO_DIR}"

echo "==> Fetching upstream"
git fetch upstream

echo "==> Checking out ${BRANCH}"
git checkout "${BRANCH}"

echo "==> Fast-forwarding from upstream/${BRANCH}"
git merge --ff-only "upstream/${BRANCH}"

echo "==> Pushing updated branch to origin"
git push origin "${BRANCH}"

echo "==> Reinstalling NemoClaw from local checkout"
bash install.sh

echo "==> Done"
