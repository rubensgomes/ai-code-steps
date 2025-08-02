# Import project to GitHub

This files describes Rubens' steps to import a local project to GitHub.

## Import Local Repo to GitHub

You should now create a new repository and push the newly created project to
Git (e.g., GitHub). This is so that we can have a remote backup of our project
prior to applying the AI related changes.

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

    git init -b main
    git add .
    git commit -m "initial commit" -a
    gh repo create --homepage "https://github.com/${ENV_MAP[USER_ID]}" \
      --public "${ENV_MAP[PROJECT_NAME]}"
    git remote add origin "https://github.com/${ENV_MAP[USER_ID]}/${ENV_MAP[PROJECT_NAME]}"
    git push -u origin main

    ```
