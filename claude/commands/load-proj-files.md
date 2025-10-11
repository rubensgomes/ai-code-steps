---
description: Read and load the given filename found in the project.
argument-hint: Filename of a project file.
---

# Load Project File Command

1. If no argument is provided, respond with "Error: No file provided."
2. IF the file `$ARGUMENT` is not found in the project, respond with "Error:
   context file $ARGUMENT` not found in project."
3. Delete the file `misc/memory/PROJ_$ARGUMENT` if it exists. Do not read it,
   simply delete it.
4. Read and load the project file `$ARGUMENT`.
5. Read and load any conditional files referenced inside the project
   file `$ARGUMENT` (e.g., if reading `CLAUDE.md` and it references
   `CLAUDE_PYTHON.md`, load that file too).
6. Show the path to the project file just read, and store your understanding 
   after reading the file in `misc/memory/PROJ_$ARGUMENT`.
