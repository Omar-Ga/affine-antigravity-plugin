#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_NAME="affine"
TARGET_MODE="${1:---global}"

echo "========================================="
echo " Installing AFFiNE Antigravity Plugin"
echo "========================================="

if [ "$TARGET_MODE" = "--workspace" ]; then
  DEST_DIR="${2:-.}/.agents/plugins/${PLUGIN_NAME}"
  echo "Installing as workspace plugin into: $DEST_DIR"
  mkdir -p "$DEST_DIR"
  cp -r "$SCRIPT_DIR"/* "$DEST_DIR"/
  echo "✓ Workspace plugin installed successfully."
  echo "Restart Antigravity IDE or start a new agy session in this workspace to activate."
  exit 0
fi

# Global installation
if command -v agy >/dev/null 2>&1; then
  echo "Found Antigravity CLI ('agy'). Installing via CLI..."
  agy plugin install "$SCRIPT_DIR"
  echo "✓ Plugin installed via agy CLI."
else
  DEST_DIR="$HOME/.gemini/config/plugins/${PLUGIN_NAME}"
  echo "Installing globally to: $DEST_DIR"
  mkdir -p "$DEST_DIR"
  cp -r "$SCRIPT_DIR"/* "$DEST_DIR"/
  echo "✓ Plugin copied to global plugins directory."
fi

echo ""
echo "Installation complete!"
echo "Please restart Antigravity or the language server to load the new plugin."
