# Scaffold new Gradle project

This file describes Rubens' steps to scaffold a new project to be developed with
the assistance of [Claude Code](https://www.anthropic.com/claude-code).

## Steps to scaffold a new Gradle project

- Edit the `env.sh` and configure the environment variables appropriately. The
  `env.sh` file is used to set up the environment variables needed for the
  `ai-code-steps` project. It should be sourced before running below commands.
- Run gradle init to scaffold a new Gradle project.

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

    mkdir -p "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" || {
      printf "Failed to create directory %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
      sleep "${TIMEOUT}"; exit 1
    }

    cd "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" || {
      printf "Failed to change directory to %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
      sleep "${TIMEOUT}"; exit 1
    }

    gradle init \
      --type java-application \
      --dsl kotlin \
      --test-framework junit-jupiter \
      --package "${ENV_MAP[PACKAGE]}" \
      --project-name "${ENV_MAP[PROJECT_NAME]}"  \
      --no-split-project  \
      --java-version 21 <<< 'no' || {
      printf "Failed to initialize Gradle project %s\n" "${ENV_MAP[PROJECT_NAME]}" >&2
      sleep "${TIMEOUT}"; exit 1
    }
    ```

