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
# Description: This file defines a key-value pair environment variable map
# containing properties to be replaced in the template files included in
# this project.
#
# Pre-requisites: Bash 4.2 or later due to the use of associative arrays.
#
# Author: Rubens Gomes

# TODO: Change the associative array values below to match your project configuration.
# Associative array requires Bash 4.2 or later.
declare -rxA ENV_MAP=(
  [DEVELOPER_NAME]="Rubens Gomes"
  [EMAIL]="rubens.s.gomes@gmail.com"
  [MAIN_CLASS]="com.rubensgomes.testms.App"
  [PACKAGE]="com.rubensgomes.testms"
  [PROJECT_NAME]="test-ms"
  [PROJECT_TITLE]="Test Management Microservice"
  # PROJECT_TYPE can be "app" or "lib"
  [PROJECT_TYPE]="app"
  [USER_ID]="rubensgomes"
)


