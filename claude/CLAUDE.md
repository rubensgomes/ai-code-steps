## Workflow Rules

1. MUST plan first → Get approval → Store plan in the project tasks folder: 
   `misc/tasks`
2. Use checkboxes in task plan files:
   - - [ ] Add new DTO
   - - [ ] Update service layer
   - - [ ] Add unit test
3. Work incrementally → Small tasks, check off as completed
4. Simple communication → High-level summary after each step
5. Prefer simplicity → Minimal changes, small commits, no unnecessary
   complexity
6. Wrap up → Add Review section summarizing what was done and why
7. MUST check off checkboxes as tasks complete

## General Coding Guidelines

1. Clarity over cleverness
2. Follow SOLID & Clean Code principles
3. Functions/methods: <20 lines ideal, max 60
4. Descriptive names, no abbreviations
5. Document public code (classes, methods, modules, packages)
6. Avoid globals and static state
7. Never swallow exceptions silently, provide clear messages
8. Avoid deep nesting, use early returns
9. No magic numbers, use constants
10. Prefer immutability and side-effect-free functions
11. DRY principle
12. Log meaningfully with context, avoid sensitive info

## Critical Reminders

- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files over creating new ones
- NEVER proactively create documentation (*.md, README) unless explicitly
  requested
- Do what's asked; nothing more, nothing less

## Load Additional Files

IF the project is Python-based
THEN load `~/.claude/CLAUDE_PYTHON.md` file for Python-specific guidelines.
ELSE IF the project is Java-based
THEN load `~/.claude/CLAUDE_JAVA.md` file for Java-specific guidelines.

