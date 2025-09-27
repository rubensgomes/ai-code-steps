# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Claude rules

1. First think through the problem, read the codebase for relevant files, and
   write a plan to tasks/todo.md.
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

This is a **User Account Microservice** - a cloud-native Java 21 Spring Boot
3.5.4 application that provides RESTful APIs for user account management. The
service handles user account creation, confirmation, password management,
authentication, and user information display.

**Important Note**: This project is currently in skeleton/template state with
only basic Gradle-generated files. The actual Spring Boot microservice
implementation described in the README has not been built yet.

## Technology Stack

- **Java**: 21 (LTS) with toolchain configuration
- **Build Tool**: Gradle 8.14.3 with Kotlin DSL
- **Framework**: Spring Boot 3.5.4 (planned)
- **Database**: MariaDB (latest) with single table design (planned)
- **Testing**: JUnit 5 Jupiter, Mockito, TestContainers (planned)
- **Documentation**: OpenAPI 3.0/Swagger UI (planned)
- **Security**: JWT authentication (planned)
- **Email**: Asynchronous email service integration (planned)

## Common Development Commands

### Build and Run

```bash
# Build the project
./gradlew build

# Run the application (currently basic Hello World)
./gradlew run

# Run with bootRun (once Spring Boot is added)
./gradlew bootRun
```

### Testing

```bash
# Run all tests
./gradlew test

# Run specific test class
./gradlew test --tests AppTest

# Run integration tests (once implemented)
./gradlew test --tests '*IntegrationTest'
```

### Code Quality (Planned)

```bash
# Run Checkstyle
./gradlew checkstyleMain checkstyleTest

# Run SpotBugs
./gradlew spotbugsMain spotbugsTest

# Run JaCoCo coverage
./gradlew jacocoTestReport

# Apply code formatting (Spotless)
./gradlew spotlessApply

# Check code formatting
./gradlew spotlessCheck
```

### Database Operations (Planned)

```bash
# Run Flyway migrations
./gradlew flywayMigrate

# Check migration status
./gradlew flywayInfo

# Clean database (development only)
./gradlew flywayClean
```

## Architecture Overview

### Current State

- Basic Gradle multi-module project with `app` module
- Java 21 toolchain configuration
- JUnit 5 testing setup
- Google Guava dependency

### Planned Architecture

The service will follow a layered Spring Boot architecture:

- **Controller Layer**: REST endpoints for user account operations
- **Service Layer**: Business logic implementation
- **Repository Layer**: Data access using Spring Data JPA
- **Entity Layer**: JPA entities for user account data
- **DTO Layer**: Request/response data transfer objects
- **Configuration**: Security, database, and application configuration
- **Exception Handling**: Global exception handler with proper HTTP status codes

### Database Design

Single MariaDB table approach storing:

- User ID (UUID primary key)
- Username and email (unique constraints)
- Password (hashed with bcrypt)
- Confirmation tokens and timestamps
- Account activation status
- Creation and activation timestamps (UTC)

## Key API Endpoints (Planned)

Base URL: `http://localhost:8080/api`

- `POST /useraccount` - Create user account with email confirmation
- `GET /confirm/{token}` - Confirm account creation
- `POST /password-reset-request` - Request password change
- `POST /password-reset` - Change password with token
- `POST /authenticate` - User authentication (JWT)
- `GET /useraccount/{email}` - Display user account information

## Development Notes

### Security Considerations

- JWT token-based authentication
- Secure password hashing (bcrypt)
- Token expiration and validation
- Email confirmation workflow
- Rate limiting for password reset requests

### Email Integration

- Asynchronous email sending to avoid API blocking
- HTML-formatted confirmation emails
- Integration with reliable email providers (SendGrid, Amazon SES)
- Background thread processing

### Testing Strategy

- Unit tests for service layer business logic
- Integration tests using TestContainers for database
- Controller tests for API endpoints
- Security tests for authentication flows

## Current Project Structure

```
app/
├── build.gradle.kts          # Main build configuration
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── org/example/
│   │   │       └── App.java  # Basic Hello World application
│   │   └── resources/        # Application resources (empty)
│   └── test/
│       ├── java/
│       │   └── org/example/
│       │       └── AppTest.java # Basic test
│       └── resources/        # Test resources (empty)
gradle/
├── libs.versions.toml        # Dependency version catalog
└── wrapper/                  # Gradle wrapper files
```

## Next Implementation Steps

1. Add Spring Boot dependencies and plugins to `build.gradle.kts`
2. Create proper package structure under `com.rubensgomes.useraccount`
3. Implement JPA entities and repository layer
4. Add service layer with business logic
5. Create REST controllers with proper error handling
6. Configure security with JWT authentication
7. Set up database migrations with Flyway
8. Integrate email service for confirmations
9. Add comprehensive testing suite
10. Configure application properties for different environments