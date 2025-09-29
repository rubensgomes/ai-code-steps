## Workflow Rules for Claude

1. **Understand before coding**: read the codebase, analyze the problem, and create a plan in `tasks/todo.md`.
2. **MUST** plan first, get approval, and store the plan in the project tasks folder for future reference.
3. **List** todo items with checkboxes in the tasks plan file.
   Example:
    - [ ] Add new DTO
    - [ ] Update service layer
    - [ ] Add unit test
4. **MUST** get approval** from me before starting implementation.
5. **Work incrementally**: keep tasks small and mark them as complete.
6. **Communicate simply**: after each step, give me a high-level summary of changes.
7. **Prefer simplicity**: minimal changes, small commits, no unnecessary complexity.
8. **Wrap up**: add a *Review* section to `todo.md` summarizing what was done and why.
9. **MUST** check off the checkboxes in the task plan as you complete each item.

---

## General Coding Guidelines
1. **Clarity over cleverness**: avoid premature optimization.
2. **Follow SOLID & Clean Code** principles.
3. **Keep functions/methods small**: ideally <20 lines, max 60.
4. **Use descriptive names**: no abbreviations.
5. **Document public code**: classes, methods, modules, packages.
6. **Avoid globals** and static state.
7. **Error handling**: never swallow exceptions silently, provide clear messages.
8. **Avoid deep nesting**: use early returns.
9. **No magic numbers**: replace with constants.
10. **Prefer immutability and side-effect-free functions** when possible.
11. **DRY principle**: avoid duplication.
12. **Log meaningfully**: no `print()` for production.

---

## Formatting and Style
1. **Wrap comments/docstrings** at 80 columns.
2. **Limit line length** to 80 characters.
3. Use **blank lines** to separate:
    - Imports from code
    - Functions/classes
    - Loops/conditionals from surrounding code
4. Follow **language-specific style guides** (PEP8 for Python, Google Style for Java/Kotlin).

IF the project is Python-based
THEN read and follow the `CLAUDE_PYTHON.md` file for Python-specific guidelines.
ELSE IF the project is Java-based
THEN read and follow the `CLAUDE_JAVA.md` file for Java-specific guidelines.

