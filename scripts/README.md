# scripts

This folder contains various scripts that can be used for different purposes
during my AI projects.

## `backup_claude_config.sh`

This script makes a complete backup of Claude's configuration settings found
in the user's home directory. Then, it completely removes all those Claude
setting files and folders, effectively resetting Claude to its default state.

### Usage

```bash
./backup_claude_config.sh
```

You can restore the backup by extracting the tar.gz file created in your
home directory:

```bash
tar -xzf ~/claude_backups/claude_backup_YYYYMMDD_HHMMSS.tar.gz -C ~
```

## `copy_and_overwrite.sh`

This script is used to copy Claude commands and instruction files from this
project folders to the user's home directory.

### Usage

```bash
./copy_and_overwrite.sh ../claude ~/.claude
```
