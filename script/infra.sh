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

# File: infra.sh
#
# Description: This file replaces tokens (e.g., @PROJECT_NAME@) found in the
# templated files (gradle.properties.template, settings.gradle.kts.template)
# and copies them to the new project.
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
## GLOBAL CONSTANTS ############################################################

# the file(s) to modify
declare -ra MODIFIED_TEMPLATE_FILES=(
  "template/gradle.properties.template"
  "template/settings.gradle.kts.template"
  "template/README.md.template"
)

# ENV_MAP[PROJECT_NAME] is defined in the script/env.sh.
readonly NEW_PROJ_FOLDER="${HOME}/dev/${ENV_MAP[PROJECT_NAME]}"


################################################################################
## Configures shell options, unset aliases and other initialization.
##
## Globals:
##   None.
## Arguments:
##   None.
## Returns:
##   0 always.
################################################################################
infra::init() {

  # ensure no aliases are used during the execution of script
  \unalias -a

  set -o errexit  # abort on nonzero exitstatus
  set -o nounset  # abort on unbound variable
  set -o pipefail # don't hide errors within pipes

  return 0
}


################################################################################
## Parses files defined in MODIFIED_TEMPLATE_FILES and replaces the tokens with token
## values defined in ENV_MAP from env.sh.
##
## Globals:
##   ENV_MAP
##   MODIFIED_TEMPLATE_FILES
## Arguments:
##   none
## Returns:
##   0 if okay; something else if fails.
################################################################################
infra::replace_tokens() {

  local file replacement_value temp_file token

  # Loop through each file
  for file in "${MODIFIED_TEMPLATE_FILES[@]}"; do
    # Create a temporary file for modifications
    temp_file=$(mktemp)

    # Copy original file to temp file
    cp "${file}" "${temp_file}" || {
      printf "Failed to copy %s to temporary file %s.\n" "${file}"  "${temp_file}" >&2
      return 1
    }

    # Loop through each replacement
    for token in "${!ENV_MAP[@]}"; do
      replacement_value="${ENV_MAP[$token]}"
      # Use sed to replace in the temporary file
      # The 'g' flag ensures all occurrences on a line are replaced
      # Use a different delimiter if your token contains '/'
      sed -i "s|@${token}@|${replacement_value}|g" "${temp_file}" || {
        printf "Failed to replace %s with %s in %s.\n" "@${token}@" \
          "${replacement_value}" "${temp_file}" >&2
        return 1
      }
    done

    # Overwrite the original file with the modified temporary file
    mv "${temp_file}" "${file}.NEW" || {
      printf "Failed to move temporary file back to %s.\n" "${file}" >&2
      return 1
    }
  done

  return 0
}

################################################################################
## Copies and renames the non-updated template files to the new project.
##
## Globals:
##   NEW_PROJ_FOLDER
## Arguments:
##   none
## Returns:
##   0 if okay; something else if fails.
################################################################################
infra::copy_files() {

  cp -f .gitignore "${NEW_PROJ_FOLDER}" || {
    printf "Failed to copy .gitignore to ${NEW_PROJ_FOLDER}/.gitignore\n" >&2
    return 1
  }

  cp -f .gitattributes "${NEW_PROJ_FOLDER}" || {
    printf "Failed to copy [%s] to [%s]\n" ".gitattributes" "${NEW_PROJ_FOLDER}" >&2
    return 1
  }

  local build_file="template/build.gradle.kts.template"
  cp -f "${build_file}" "${NEW_PROJ_FOLDER}/lib/build.gradle.kts" || {
    printf "Failed to copy [%s] to [%s]\n" "${build_file}" \
      "${NEW_PROJ_FOLDER}/lib/build.gradle.kts\n" >&2
    return 1
  }

  return 0
}

################################################################################
## Moves the update templated files to the new project.
##
## Globals:
##   NEW_PROJ_FOLDER
## Arguments:
##   none
## Returns:
##   0 if okay; something else if fails.
################################################################################
infra::mv_files() {
  local file folder new_file

  printf "changing to template folder.\n"
  pushd "template"

  for new_file in *.NEW; do
    file="${new_file/%.template.NEW/}"
    folder="${NEW_PROJ_FOLDER}"

    if [[ "${file}" =~ gradle.properties ]]; then
      folder="${NEW_PROJ_FOLDER}/${ENV_MAP[PROJECT_TYPE]}"
    fi

    printf "moving [%s] to [%s].\n" "${new_file}" "${folder}/${file}"
    mv "${new_file}" "${folder}/${file}" || {
      printf "Failed to move [%s] to [%s]\n" "${new_file}" "${folder}/${file}" >&2
      popd
      return 1
    }
  done

  popd
  return 0
}

################################################################################
## Remove the new project's local.toml file. Because we are using a remote
## version catalog.
##
## Globals:
##   NEW_PROJ_FOLDER
## Arguments:
##   none
## Returns:
##   0 if okay; something else if fails.
################################################################################
infra::rm_toml() {

  pushd "${NEW_PROJ_FOLDER}" || {
    printf "Failed to change directory to %s\n" "${NEW_PROJ_FOLDER}" >&2
    return 1
  }

  # Remove the local.toml file if it exists
  if [[ -f "gradle/libs.versions.toml" ]]; then

    rm -f "gradle/libs.versions.toml" || {
      printf "Failed to remove gradle/libs.versions.toml\n" >&2
      popd
      return 1
    }

  fi

  popd
  return 0
}

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

  printf "initialize the environment\n"
  infra::init || {
    printf "Failed to initialize the environment.\n" >&2
    return 1
  }

  local proj_root=
  if ! proj_root="$(git rev-parse --show-toplevel)"; then
    printf "failed to determine git project NEW_PROJ_FOLDER.\n" >&2
    return 1
  fi

  printf "changing to: %s\n" "${proj_root}"
  cd "${proj_root}" || {
    printf "failed to change to %s\n" "${proj_root}"
    return 1
  }

  printf "replace tokens in the template files\n"
  infra::replace_tokens || {
    printf "Failed to replace tokens in the files.\n" >&2
    return 1
  }

  printf "copy non-updated template files to the new project directory\n"
  infra::copy_files || {
    printf "Failed to copy files to the new project directory.\n" >&2
    return 1
  }

  printf "copy the modified template files to the new project directory\n"
  infra::mv_files || {
    printf "Failed to move files to the new project directory.\n" >&2
    return 1
  }

  printf "remove the new project's local version catalog toml file\n"
  infra::rm_toml || {
    printf "Failed to remove the new project local version catalog toml file.\n" >&2
    return 1
  }

  return 0
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
