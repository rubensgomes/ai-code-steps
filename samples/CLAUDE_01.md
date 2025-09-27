# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Claude Rules

1. First think through the problem, read the codebase for relevant files, and
   write a plan for the tasks you need to complete.
2. The plan should have a list of todo items that you can check off as you
   complete them
3. Before you begin working, check in with me and I will verify the plan.
4. Then, begin working on the todo items, marking them as complete as you go.
5. Please every step of the way just give me a high level explanation of what
   changes you made
6. Make every task and code change you do as simple as possible. We want to
   avoid making any massive or complex changes. Every change should impact as
   little code as possible. Everything is about simplicity.
7. Finally, add a review section to the [todo.md](http://todo.md/) file with a
   summary of the changes you made and any other relevant information.

## Project Overview

This is a **User Management Microservice** (`usermgr-ms`) built with Java 21 and
Gradle. The project is currently in the initial template phase but is designed
to be a Spring Boot-based RESTful API for user account management,
authentication, and related operations.

**Target Architecture**: Spring Boot microservice with layered architecture (
Controller → Service → Repository) using MariaDB for persistence and JWT for
authentication.

## Development Commands

### Build & Run

```bash
# Build the project
./gradlew build

# Run the application
./gradlew bootRun

# Run with specific profile (when Spring Boot is added)
./gradlew bootRun --args='--spring.profiles.active=dev'

# Create executable JAR
./gradlew bootJar

# Clean build artifacts
./gradlew clean
```

### Testing

```bash
# Run all tests
./gradlew test

# Run integration tests (when implemented)
./gradlew integrationTest

# Run all checks (tests, linting)
./gradlew check
```

### Docker Operations (when implemented)

```bash
# Build Docker image using Cloud Native Buildpacks
./gradlew bootBuildImage

# Run with Docker Compose
docker-compose up -d
```

## Architecture & Project Structure

### Current State

The project is based on a Gradle Java template with:

- **Java 21** with modern language features
- **Gradle 8.14.3** with Kotlin DSL
- **Multi-module structure**: Root project with `app` module
- **JUnit Jupiter 5.12.1** for testing
- **Google Guava** utility library

### Target Package Structure

```
src/main/java/com/rubensgomes/usermgr/
├── config/          # Spring configuration classes
├── controller/      # REST API controllers
├── service/         # Business logic layer
├── repository/      # Data access layer (JPA repositories)
├── model/          # Domain models and DTOs
├── exception/      # Custom exception handlers
└── Application.java # Spring Boot main class
```

### Key Configuration Files

- `project-config.yaml` - Custom project metadata including package paths and
  API configuration
- `gradle/libs.versions.toml` - Centralized dependency version management
- `app/build.gradle.kts` - Main module build configuration with Java 21
  toolchain

### Current Implementation Gap

**Note**: The project is in transition from a basic Gradle template to a full
Spring Boot microservice. Key missing components:

- Spring Boot dependencies and configuration
- Database schema and JPA entities
- REST controllers and security configuration
- Application configuration files (application.yml)
- Docker containerization setup

### API Design (from documentation)

- **Base URL**: `http://localhost:8080/api`
- **Primary Resource**: User management at `/api/v1/users`
- **Authentication**: JWT-based authentication
- **Database**: Single table in MariaDB for user accounts
- **Key Features**: Account creation, email confirmation, password management,
  authentication

## Development Notes

### Package Migration Required

The current code uses `org.example` package but should be migrated to
`com.rubensgomes.usermgr` as specified in project-config.yaml.

### Next Implementation Steps

1. Add Spring Boot dependencies to `app/build.gradle.kts`
2. Update main class path and package structure
3. Add database configuration and JPA entities
4. Implement REST controllers for user management APIs
5. Configure Spring Security with JWT authentication
6. Add application.yml configuration files for different environments

### Testing Strategy

- Unit tests for service and utility classes
- Integration tests using Testcontainers for database interactions
- API endpoint tests for REST controllers
- Separate test profiles for different environments