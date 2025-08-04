# Infrastructure of new project

This file describes Rubens' steps to set up the basic build infrastructure of
the new project to be developed using [Claude Code](https://www.anthropic.com/claude-code).

## Steps to set up Gradle build infrastructure

- Copy the following files included in this folder to new project

    - .gitignore
    - .gitattributes
    - build.gradle.kts.template

- Replaces tokens and copies below files to the new project

    - settings.gradle.kts.template
    - gradle.properties.template

- Switch to the new project directory

- The following script does all the above steps automatically:

    ```shell
    # time to wait to allow user to read the error message
    TIMEOUT=10
    # derive the local git root project path
    PROJ_ROOT="$(git rev-parse --show-toplevel)"
   
    cd "${PROJ_ROOT}" || {
      printf "Failed to change directory to %s\n" "${PROJ_ROOT}" >&2
      sleep "${TIMEOUT}"; exit 1
    }

    # env.sh should be configured before running this script.
    source "env.sh" || {
      printf "Failed to source env.sh.\n" >&2
      sleep "${TIMEOUT}"; exit 1
    }

    "${PROJ_ROOT}/infra.sh" || {   
      printf "Failed to run infra.sh.\n" >&2
      sleep "${TIMEOUT}"; exit 1
    }

    cd "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" || {
      printf "Failed to change directory to %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
      sleep "${TIMEOUT}"; exit 1
   }
   ```
