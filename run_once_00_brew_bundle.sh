#!/usr/bin/env bash
set -euo pipefail

BREWFILE="$(chezmoi source-path)/Brewfile"

if [[ ! -f "$BREWFILE" ]]; then
  echo "No Brewfile found at $BREWFILE"
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file "$BREWFILE"