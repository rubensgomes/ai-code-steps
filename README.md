# AI Code Steps

This file describes Rubens' steps to set up a new project to be developed with
the assistance of [Claude Code](https://www.anthropic.com/claude-code).

_The steps were created and tested under the UNIX macOS system._

## Steps to scaffold a new Gradle project

Refer to the [SCAFFOLD.md](SCAFFOLD.md) file for the steps to scaffold a new
Gradle project.

## Steps to set up Gradle build infrastructure

Refer to the [INFRA.md](INFRA.md) file for the steps to set up
the Gradle build files.

## Steps to import the newly created project to a GitHub repository

Refer to the [IMPORT.md](IMPORT.md) file for the steps to import the newly
created project to a GitHub repository.

## AI prompts to generate a README.md and API.md files

1. Prompt [Claude](https://claude.ai/) to generate `README.md` and `API.md`
   files for the new project. For example you may use the following prompt (
   adapted to your project):

```text
I need a concise README.md that works well with Claude Code during project
initialization. The project is a microservice application that provides RESTful
APIs to register and authenticate users. The project should be called user-ms, 
and the application Java root package should be com.rubensgomes.userms.

The project tech stack should consist of:

- Java 21
- Spring Boot 3.5.x
- Gradle 9.0.x
- MariaDB 11.8.x
- H2 Database for testing and development
- Spring Projects APIs and dependencies
- Sprint Security for authentication and authorization
- Spring Data JPA for database access
- Lombok for boilerplate code reduction
- OpenAPI 3.1 for API documentation
- Swagger UI for API testing
- JUnit 5 for unit testing
- Mockito for mocking dependencies in unit tests
- JWT token for authentication and authorization

The user database table should include the following fields:
- email
- password
- timestamps for when the user was created and when the password was changed

I need a separate API.md API documentation to be used by Claude Code as well.
The README.md file should have a link to the API.md. The API documentation should
address APIs to register a user, change the user's password, and authenticate
the user.  If the user forgets his password, he can can request to change the password by
having a link being sent to his email. 

The API.md file should include:

- Endpoint list and descriptions
- HTTP methods (GET, POST, PUT, DELETE)
- URL paths to the Swagger UI and OpenAPI 3.1 JSON and YAML
- Request/response examples (with curl or JSON)
- Query/path/body parameters
- Authentication info (e.g., JWT, OAuth)
```

## Add README.md and API.md files to the project

Copy and paste the generated `README.md` and `API.md` files to the root of the
newly created project.

## Update the README.md and API.md files

Now that you have the `README.md` and `API.md` files, you can update them
with any additional information you want to add, remove or change, such as:

### Api.md

- Update the API endpoints to match your project requirements.
- Add any additional endpoints that you may need.
- Update the request/response examples to match your project requirements.
- Add any additional information that you may need, such as error codes,
  authentication methods, and query parameters.
- Change the API paths, if needed.

### README.md

- Look for any section that needs more details, such as the project description,
  tech stack, and license.
- Add any additional information that you may need, such as the project
  structure, database schema, and quick start instructions.

### Example of final README.md and API.md files

Refer to the [user-ms](https://github.com/rubensgomes/user-ms) for an example of
README.md and API.md after the updates.

## Let's start using Claude Code!

### Initialize the project with Claude Code

1. Initialize the project with Claude Code:
    - Open the newly created project in IntelliJ IDEA.
    - Open the terminal and type `claude` to start the Claude Code
    - At the Claude code promp, type `/init` and accept the default responses.

2. Add the following in the CLAUDE.md after the `# CLAUDE.md` header:

    ```markdown
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
    ```

3. Create a Claude checkpoint by typing at the Claude Code prompt:

    ```shell
    claude checkpoint "Initial project setup complete"   
    ```

### Create and execute plans with Claude Code

#### Plan: Infrastructure plan to set up Gradle build files

- Go to plan mode by hitting SHIFT + TAB + TAB on macOS.

- Type the following prompt to create a plan:

    ```text
    I need to check and update the Gradle build file to make sure it has all 
    the dependencies and plugins that are needed to support the project codebase.  
    ```

- Once the plan is created, review it and make sure it is correct. Then,type the
  following prompt to save a plan:

    ```text
    I need to save this plan for later execution.
    ```

- Once the plan is saved, get out of plan mode hitting SHIFT + TAB to go back to
  the code mode. Then, create a new checkpoint prompting:

    ```text
    claude checkpoint "Prior to execute gradle-dependencies-plan.md"
    ```

- Now you can execute the plan by typing:

    ```text
    claude execute "tasks/gradle-dependencies-plan.md"
    ```
- Run some gradle tasks like `gradle clean build` to make sure the project
  builds successfully.

- Then, create a new checkpoint prompting:

    ```text
    claude checkpoint "Gradle dependencies plan executed successfully"
    ```

- Finally, run a git commit to save the changes made by Claude Code:

    ```text
    git add .
    git commit -m "Gradle dependencies plan executed successfully"
    ```
  
#### Plan: Generate the codebase

- Go to plan mode by hitting SHIFT + TAB + TAB on macOS.

- Type the following prompt to create a plan:

    ```text
    I need to generate all the source code for the project and the 
    corresponding test code as well. The code should be generated based on the
    README.md and API.md files that was generated earlier. The code should be 
    generated in a way that is easy to understand and maintain. The code should
    be generated along with documentation for all the classes, public methods,
    class instance variables, and any documentation necessary.
    ```

- Once the plan is created, review it and make sure it is correct. Then,type the
  following prompt to save the plan:

    ```text
    I need to save this plan for later execution.
    ```

- Once the plan is saved, get out of plan mode hitting SHIFT + TAB to go back to
  the code mode. Then, create a new checkpoint prompting:

    ```text
    claude checkpoint "Prior to execute source-code-generation-plan.md"
    ```

- Now you can execute the plan by typing:

    ```text
    claude execute "tasks/source-code-generation-plan.md"
    ```

- Run some gradle tasks like `gradle clean build` to make sure the project
  builds successfully.

- Have Claude Code resolve any issues that may arise during the code generation
  process. If Claude Code asks you to review the code, do so and provide feedback
  as needed.

- Then, create a new checkpoint prompting:

    ```text
    claude checkpoint "Gradle source code plan executed successfully"
    ```

- Finally, run a git commit to save the changes made by Claude Code:

    ```text
    git add .
    git commit -m "Gradle source code plan executed successfully"
    ```
