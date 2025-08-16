#!/usr/bin/env bash

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

# File: scaffold.sh
#
# Description: This shell script uses the properties setup in "env.sh" to
# scaffold a new Java coding project.
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

  # Note that ENV_MAP is defined in the "env.sh"
  mkdir -p "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" || {
    printf "Failed to create directory %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
    return 1
  }

  cd "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" || {
    printf "Failed to change directory to %s\n" "${HOME}/dev/${ENV_MAP[PROJECT_NAME]}" >&2
    return 1
  }

  gradle init \
    --type "${ENV_MAP[GRADLE_TYPE]}" \
    --dsl kotlin \
    --test-framework junit-jupiter \
    --package "${ENV_MAP[PACKAGE]}" \
    --project-name "${ENV_MAP[PROJECT_NAME]}"  \
    --no-split-project  \
    --java-version 21 <<< 'no' || {
    printf "Failed to initialize Gradle project %s\n" "${ENV_MAP[PROJECT_NAME]}" >&2
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
