#!/usr/bin/env bash
#
# copy_and_overwrite.sh
#
# Copies all files and subdirectories from a source directory
# to a destination directory, overwriting existing files.
#
# Usage:
#   ./copy_and_overwrite.sh <source_dir> <destination_dir>
#
# Example:
#   ./copy_and_overwrite.sh ./build/output ./deploy/assets
#

set -euo pipefail

# --- Helper functions ---
error() {
  echo "❌ Error: $*" >&2
  exit 1
}

info() {
  echo "➡️  $*"
}

# --- Validate arguments ---
if [[ $# -ne 2 ]]; then
  error "Usage: $0 <source_dir> <destination_dir>"
fi

SRC="$1"
DEST="$2"

# Check source directory
if [[ ! -d "$SRC" ]]; then
  error "Source directory does not exist: $SRC"
fi

# Create destination directory if missing
if [[ ! -d "$DEST" ]]; then
  info "Creating destination directory: $DEST"
  mkdir -p "$DEST"
fi

# --- Copy operation ---
info "Copying from '$SRC' to '$DEST' (overwriting existing files)..."

# The -r flag copies directories recursively
# The -f flag forces overwriting without confirmation
cp -vrf "$SRC"/* "$DEST"/

info "✅ Copy completed successfully."
