---
description: Read and load the given filename in the user's .claude folder.
argument-hint: Filename of a user's .claude folder file.
---

# Load User File Command

1. If no argument is provided, respond with "Error: No file provided."
2. IF the file `~/.claude/$ARGUMENT` is not found , respond with "Error:
   context file `~/.claude/$ARGUMENT` not found."
3. Delete the file `misc/memory/USER_$ARGUMENT` if it exists. Do not read it,
   simply delete it.
4. Read and load the file @~/.claude/$ARGUMENT
5. Read and load any conditional files referenced inside `~/.claude/$ARGUMENT`
   (e.g., if reading `CLAUDE.md` and it references `CLAUDE_PYTHON.md`, load that
   file too).
6. Show the path to the file just read, and store your understanding after
   reading the file in `misc/memory/USER_$ARGUMENT`.
