## Formatting and Style

1. Use Spotless (Kotlin/Java) for auto-formatting.
2. Follow Google Java Style Guide for Java code.

## Source Code Organization

1. Follow standard Maven/Gradle project structure.
2. Use `src/main/{{LANGUAGE}}` for application code (e.g., src/main/java or src/main/kotlin).
3. Use `src/test/{{LANGUAGE}}` for test code (e.g., src/test/java or src/test/kotlin).
4. Use `src/main/resources` for non-code resources (e.g., application.yml).
5. Use `src/test/resources` for test resources.
6. Use `src/main/{{LANGUAGE}}/{{PACKAGE_PATH}}/` for package structure (e.g., src/main/java/com/example/app).
7. Use `src/test/{{LANGUAGE}}/{{PACKAGE_PATH}}/` for package structure (e.g., src/test/java/com/example/app).
8. Organize code into layers: config, controller, service, repository, model, dto, exception. For example:

   ```text
   src/main/(java or kotlin)/{{PACKAGE_PATH}}/
    ├── controller/      # Entry points: APIs, CLI, UI handlers
    ├── service/         # Business logic
    ├── repository/      # Data access (DB, APIs, files)
    ├── dto/             # DTO objects
    ├── model/           # Domain entities
    ├── config/          # Config, DI, environment
    ├── util/            # Cross-cutting helpers
    └── exception/       # Custom exceptions and handlers
   ```
9. MUST use a Layered architecture, N-tier or Onion style source code organization.


## Language Specific Guidelines

1. Use constructor injection for dependencies.
2. Use data classes / records for DTOs.
3. Always add Javadoc for new packages, classes, interfaces, methods and class variables, and instance variables.
4. Use Lombok to reduce boilerplate code (e.g., getters/setters, constructors.
5. Use Lombok SLF4J annotation for logging.
6. Use Java 11+ features (e.g., var, records, streams).
7. Use Optional for nullable return types instead of null.
8. Use Streams and Lambdas for collection processing.
9. Use enums for fixed sets of constants.
10. Use try-with-resources for resource management (e.g., file handling).
11. Avoid wildcard imports (e.g., import java.util.*).
12. Use `Objects.requireNonNull()` for null checks.
