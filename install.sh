#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON="${PYTHON:-python3}"

# Homebrew's graphics libraries may be installed without its bin directory in PATH.
if [[ -x /opt/homebrew/bin/pkg-config ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif [[ -x /usr/local/bin/pkg-config ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

"$PYTHON" -m venv "$ROOT/.venv"
"$ROOT/.venv/bin/python" -m pip install -r "$ROOT/requirements.txt"
"$ROOT/.venv/bin/python" "$ROOT/scripts/check_environment.py"

printf '\nInstalled in %s/.venv\n' "$ROOT"
printf 'Example: %s/.venv/bin/python %s/scripts/prepare_pair.py --help\n' "$ROOT" "$ROOT"
