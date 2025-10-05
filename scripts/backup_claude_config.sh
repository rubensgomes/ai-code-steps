#!/usr/bin/env bash
#
# backup_claude_config.sh
#
# Creates a backup of ~/.claude.json and ~/.claude
# Then removes them safely from your home directory.

set -euo pipefail

# --- Configuration ---
BACKUP_DIR="$HOME/claude_backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/claude_backup_$TIMESTAMP.tar.gz"

# --- Create backup directory if needed ---
mkdir -p "$BACKUP_DIR"

echo "📦 Creating backup tarball..."
tar -czf "$BACKUP_FILE" -C "$HOME" .claude.json .claude 2>/dev/null || {
    echo "⚠️  Warning: Some files may not exist, but continuing..."
}

# --- Verify backup exists and is non-empty ---
if [[ ! -s "$BACKUP_FILE" ]]; then
    echo "❌ Backup failed or file is empty. Aborting cleanup."
    exit 1
fi

echo "✅ Backup created at: $BACKUP_FILE"

# --- Remove old configuration safely ---
echo "🧹 Removing ~/.claude.json and ~/.claude ..."
rm -rf "$HOME/.claude.json" "$HOME/.claude.json.backup" "$HOME/.claude"

echo "✅ Cleanup complete."
