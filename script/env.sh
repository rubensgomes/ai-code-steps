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

# File: env.sh
#
# Description: This file defines a map of key-value pairs containing
# properties to be used while scaffolding the new Java coding project
#
# Pre-requisites: Bash 4.2 or later due to the use of associative arrays.
#
# Author: Rubens Gomes

# TODO: Change the associative array values below to match your project configuration.

declare -rxA ENV_MAP=(
  [DEVELOPER_NAME]="Rubens Gomes"
  [EMAIL]="rubens.s.gomes@gmail.com"
  # Gradle build project type: java-application or java-library
  [GRADLE_TYPE]="java-library"
  # only needed if you are building an ap (e.g., com.rubensgomes.userms.App)
  [MAIN_CLASS]=""
  [PACKAGE]="com.rubensgomes.mslib"
  [PROJECT_NAME]="ms-lib"
  [PROJECT_TITLE]="Microservice Library"
  # PROJECT_TYPE can be "app" or "lib"
  [PROJECT_TYPE]="lib"
  [USER_ID]="rubensgomes"
)


