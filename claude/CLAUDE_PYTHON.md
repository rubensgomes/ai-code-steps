## Formatting and Style

1. Use **Black** for auto-formatting.
2. Follow **PEP8** for Python code.
3. Use **isort** for import sorting.
4. Follow **PEP8** with a hard wrap at **80 columns**.

## Source Code Organization

1. Follow the standard Poetry source code layout structure.
2. Use `src/{{MODULE_PATH}}/` for the main project source code 
   sub-folder (e.g., `src/javamcp`).
3. Use `tests/` for test package structure (e.g., `tests/`).
4. Create sub-folders to improve separation of concerns and group related 
   functionality.
5. MUST use a feature-based, vertical slice or modular architecture source 
   code organization.
6. MUST avoid large monolithic modules.

## Language Specific Guidelines

1. Always add docstrings for new packages, modules, classes, functions, 
   class attributes, and instance variables 
2. Use **Pydantic** models for request/response validation. 
3. Use **async/await** for I/O-bound operations to improve performance.
4. Use **type hints** everywhere (def foo(x: int) -> str). 
5. Raise meaningful exceptions, don’t return None silently.
6. Use list/dict comprehensions where appropriate.
7.  Use **f-strings** for formatting (Python 3.6+).
8. Use `is` and `is not` for None checks (e.g., if x is None).
9. Use `with` statement for file operations to ensure proper resource management.
10. Use `pathlib` for file system paths instead of `os.path`.
11. Use logging instead of print statements.
12. Avoid wildcard imports (e.g., from module import *).
13. Prefer `enumerate()` over `range(len())` for loops.

## Testing Guidelines

1. **MUST** use **pytest** as the testing framework.
2. Place tests in the `tests/` directory mirroring the `src/` structure.
3. Use **pytest fixtures** for setup/teardown logic.
4. Use **pytest-cov** for measuring test coverage.
5. **Avoid** unnecessary mocking -- mock external dependencies only (DB, APIs).
6. Use **pytest-mock** for mocking dependencies.
7. **Test** behavior and outcomes, not implementation details.
8. **Use** parametrized tests (@pytest.mark.parametrize) to cover multiple 
   inputs.
9. **Keep** tests small, focused, and fast.
10. Write tests for both success and failure scenarios.
11. Aim for high test coverage (80%+), especially for critical components.
12. Name tests clearly to indicate what they are testing.
13. **MUST** test edge cases and error handling.

