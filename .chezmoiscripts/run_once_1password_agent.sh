#!/usr/bin/env bash
set -u

TARGET="$(find "$HOME/Library/Group Containers" -type s -name agent.sock 2>/dev/null | head -n1 || true)"
LINK="$HOME/.1password/agent.sock"

if [ -z "${TARGET:-}" ]; then
  echo "1Password agent socket not found."
  exit 0
fi

if [ ! -S "$TARGET" ]; then
  echo "Found path but it's not a socket: $TARGET"
  exit 0
fi

mkdir -p "$(dirname "$LINK")"
ln -sf "$TARGET" "$LINK"
echo "Linked: $LINK -> $TARGET"