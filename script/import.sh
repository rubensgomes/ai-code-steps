# Copyright 2025 Rubens Gomes
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the__LICENSE] [1].

# File: import.sh
#
# Description: This shell script uses the properties setup in "env.sh" to
# create and import the newly Java coding project to a GitHub repository.
#
# Pre-requisites: Bash 4.2 or later due to the use of associative arrays.
#
# Author: Rubens Gomes


###############################################################################
## INCLUDES ###################################################################

# -------------------- >>> Import env.sh <<< ----------------------------------

# shellcheck source=script/env.sh
source "$(dirname "${BASH_SOURCE[0]}")/env.sh" || exit

################################################################################
## The main function.
##
## Globals:
##   none.
## Arguments:
##   none
## Returns:
##   0 if okay; something else if fails.
################################################################################
main() {

  # switch to the newly created project directory
  printf "switch to folder: %s\n\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}"

  cd "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" || {
      printf "Failed to change directory to %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
      return 1
   }

  # creates a new local Git repository
  printf "create local Git folder at: %s\n\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}"

  git init -b main || {
      printf "Failed to Git init directory %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
      return 1
  }

  # adds files from new local Git repository
  printf "add files to local Git folder at: %s\n\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}"

  git add . || {
      printf "Failed to Git add directory %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
      return 1
  }

  printf "git commit files at: %s\n\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}"

  git commit -m "initial commit" -a || {
      printf "WARNING: failed to commit files to local git repository.\n" >&2
  }

  local remote_repo="https://github.com/${ENV_MAP[USER_ID]}/${ENV_MAP[PROJECT_NAME]}"
  printf "check if remote GitHub repository exits: %s\n\n" "${remote_repo}"

  if gh repo view "${remote_repo}"; then
    printf "repository exists: %s\n" "${remote_repo}"
  else
    printf "create remote GitHub repository from: %s\n" "${remote_repo}"
    gh repo create --homepage "https://github.com/${ENV_MAP[USER_ID]}" --public "${ENV_MAP[PROJECT_NAME]}" || {
        printf "WARNING: Failed to create GitHub repository.\n" >&2
        return 1
    }
  fi

  # check if remote repo has been added locally, and add if not
  printf "checking if remote repo [%s] has been added locally.\n\n" "${remote_repo}"

  if git remote -v; then
    printf "remote Git repo [%s] has been added locally.\n" "${remote_repo}"
  else
    # Add the remote origin
    printf "Adding remote origin to GitHub repository.\n\n"
    git remote add origin "${remote_repo}" || {
        printf "WARNING: Failed to add remote origin.\n" >&2
        return 1
    }
  fi

  printf "pushing local changes to GitHub repository.\n\n"
  git push -u origin main || {
      printf "Failed to push to remote repository.\n" >&2
      return 1
  }

}

################################################################################
## -----------------------------------------------------------------------------
## -------------------- >>> Main Program Body <<< ------------------------------
## -----------------------------------------------------------------------------

if ! main "${@:-}"; then
  printf "\n%s failed!\n" "${PRG}" >&2
  exit 1
fi

printf "done\n"
