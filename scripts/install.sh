#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" >/dev/null 2>&1 && pwd || pwd)"
INSTALLER_LOCAL="$(cd "$SCRIPT_DIR/.." >/dev/null 2>&1 && pwd || pwd)/zeroclaw_install.sh"
BOOTSTRAP_LOCAL="$SCRIPT_DIR/bootstrap.sh"
REPO_URL="https://github.com/zeroclaw-labs/zeroclaw.git"

echo "[deprecated] scripts/install.sh -> ./zeroclaw_install.sh" >&2

if [[ -x "$INSTALLER_LOCAL" ]]; then
  exec "$INSTALLER_LOCAL" "$@"
fi

if [[ -f "$BOOTSTRAP_LOCAL" ]]; then
  exec "$BOOTSTRAP_LOCAL" "$@"
fi

echo "error: remote clone-and-exec fallback has been removed for security." >&2
echo "Use a local checkout instead:" >&2
echo "  git clone $REPO_URL" >&2
echo "  cd zeroclaw" >&2
echo "  ./zeroclaw_install.sh --help" >&2
exit 1
