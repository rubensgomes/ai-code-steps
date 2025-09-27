# AI Steps

This file describes Rubens' steps to set up a new project to be developed with
the assistance of [Claude Code](https://www.anthropic.com/claude-code).

Note that these steps are were created
by [Rubens Gomes](https://rubensgomes.com)
and are intended to be used as a blueprint for new projects. Feel free to adapt
them to your needs.

_The steps were created and tested under the UNIX macOS operation system._

## Steps to set up a new project

1. Edit the `env.sh` and configure the environment variables appropriately. The
   `env.sh` file is used to set up the environment variables needed for the
   project. It should be sourced before running below commands in this project.

2. Run gradle init to scaffold a new Gradle project.

    ```shell
    # env.sh should be configured before running this script.
    source "env.sh" || {
      print "Failed to source env.sh. "
      exit 1
    }
    mkdir -p "${HOME}/dev/${PROJECT_NAME}" || {
      print "Failed to create directory %s\n" "${HOME}/dev/${PROJECT_NAME}"
      exit 1
    }
    cd "${HOME}/dev/${PROJECT_NAME}"
    gradle init \
      --type java-application \
      --dsl kotlin \
      --test-framework junit-jupiter \
      --package "${PACKAGE}" \
      --project-name "${PROJECT_NAME}"  \
      --no-split-project  \
      --java-version ${JAVA_VERSION} || {
      print "Failed to initialize Gradle project %s\n" "${PROJECT_NAME}"
      exit 1
    }
    ```

2. Add the following default files included in this folder to your project:

    - .gitignore
    - .gitattributes
    - settings.gradle.kts
    - build.gradle.kts
    - gradle.properties

    ```shell
    # TODO change properties appropriately
    PROJECT_NAME="user-ms"
    # PROJECT_TYPE can be "app" or "lib"
    PROJECT_TYPE="app"
    # Confirm the copy of the files below.
    cp -vi .gitignore "${HOME}/dev/${PROJECT_NAME}/.gitignore" || exit 1
    cp -vi .gitattributes "${HOME}/dev/${PROJECT_NAME}/.gitattributes" || exit 1
    cp -vi settings.gradle.kts "${HOME}/dev/${PROJECT_NAME}/settings.gradle.kts" || exit 1
    cp -vi build.gradle.kts "${HOME}/dev/${PROJECT_NAME}/${PROJECT_TYPE}/build.gradle.kts" || exit 1
    cp -vi gradle.properties "${HOME}/dev/${PROJECT_NAME}/${PROJECT_TYPE}/gradle.properties" || exit 1
    cd "${HOME}/dev/${PROJECT_NAME}" || exit 1
    ```

3. Make the necessary TODO or other changes in the files:

    - .gitignore: Add any additional files or directories to ignore.
    - .gitattributes: Add any additional attributes for Git.
    - settings.gradle.kts: Update the project name and other settings as needed.
    - build.gradle.kts: Update the dependencies, plugins, and configurations as
      needed.
    - gradle.properties: Update properties such as `group`, `version`, and any
      other relevant properties.
5.
6.
7.
8. above, such as updating the
   project name, description, and so on. Note that this file is created
   for [Rubens Gomes](https://rubens.com) projects.

3. Initialize the project's repository in GitHub.

3. Prompt Claude or ChatGPT to create a concise README.md, API.md, and other
   files file to be used by Claude Code. For example:

I need a concise README.md that works well with Claude Code during project
initialization. The project is a microservice application that provides RESTful
APIs to register and authenticate users. As stated below all the relevant API
documentation should be placed in a separate API.md file. The project should be
called user-ms, and the tech stack should consist of:

- Java 21
- Spring Boot 3.5.x
- Gradle 9.0.x
- MariaDB 11.8.x
- Spring Pojrects APIs and dependencies

I need a separate API.md API documentation to be used by Claude Code as well.
The README.md file should have a link to an API.md. The API documentation should
address APIs to register a user, change the user's password, and authenticate
the user. The user's account is expected to have username, email, password, and
timestamps of when user was created and when the password was changed. A
confirmation email should be sent to the user to confirm his registration. If
the user forgets his password, he can can request to change the password by
having a link being sent to his email. The API.md file should include:

- Endpoint list and descriptions
- HTTP methods (GET, POST, PUT, DELETE)
- URL paths to the Swagger UI and OpenAPI 3.1 JSON and YAML
- Request/response examples (with curl or JSON)
- Query/path/body parameters
- Authentication info (e.g., JWT, OAuth)

I need a separate Gradle Kotlin DSL build.gradle.kts, and gradle.properties
files created. The Gradle build file should include the following plugins:
jacoco, org.springframework.boot, io.spring.dependency-management,
com.diffplug.spotless, org.sonarqube, net.researchgate.release, and
io.freefair.lombok.

2. Add README.md to the project
    - See a blueprint README.md in this folder.
    - Or go to claude.ai and ask Claude to generate one for you. For example you
      may type the following prompt:

Generate a blueprint README.md file for a Java 21 microservice application
project using the latest released version of Spring Boot, and a Gradle Kotlin
DSL build file. This README.md is planed to be used by Claude Code during the
initialization of the project.

Prompt Claude to make any necessary changes to the README.md. For example,
change the project name, remove redundant tools, and so on. Once you have the
README.md as close as possible to what you need, add it to the project.

3. Add an API.md to the project

- See a blueprint API.md in this folder
- Or go to claude.ai and ask Claude to generate one for you. For example you
  may type the following prompt:

Generate a blueprint API.md API Documentation for the microservice project. I
need this API documentation to contain an Overview section, Quick Reference
listing the various expected HTTP methods, Authentication, sample Requests and
Responses, HTTP Status code, support for OpenAPI 3.1.1 spec, and URL to get to
the corresponding Swagger UI and OpenAPI yaml spec document. I plan to use this
API documentation with Claude Code during the initialization of the project.

Prompt Claude to make any necessary changes to the API.md. For example, change
any path, project name, remove redundant tools, and so on. Once you have the
API.md as close as possible to what you need, add it to the project.

4. Copy the provided "project-config.yaml" to the project..

5. Start IntelliJIDEA, and open the created project. Then, update the properties
   in the "project-config.yml" file.

6. Add detailed information about the project description, overview, and
   functionalities. Add detailed descriptions of what the APIs should do. Add
   references in the README.md to the below created API.md.

7. Start terminal prompt from within IntelliJ IDEA, and type claude.

8. Prompt Claude Code "Initialize the project using project-config.yaml to
   replace all template placeholders in the blueprint files"

9. Type /init.

Follow the prompts, and then type /init. Accept the default answers. This step
generates a CLAUDE.md file with the project's configuration.

10. Add the attached CLAUDE_RULES.md to the top of the CLAUDE.md file.

11. Now go to Claude Code "Plan Mode": Shift + TAB + TAB

12. Start adding and executing plans.

13. Run automated tests, review code, start application, test....
