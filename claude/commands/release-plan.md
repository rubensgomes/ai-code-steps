---
description: Generate a release plan for the project.
argument-hint: Git repository name (e.g., rubensgomes/javamcp)
---

# Generate Release Plan

1. If no argument is provided, respond with "Error: Git repository name is required."
2. If the argument is provided, check if the $ARGUMENT repository exists.
3. If the repository exists, check if the user has access to it.
4. If the user has access to the repository, generate the release plan.
5. If the user does not have access to the repository, respond with "Error: 
   You do not have access to the $ARGUMENT repository."
6. If the repository does not exist, respond with "Error: The repository 
   $ARGUMENT does not exist."
7. Upon approval of the release plan:
  - MUST ensure a CHANGELOG.md file exists in the project
  - MUST update the CHANGELOG.md with the current release changes
  - MUST save the release plan in the project's docs folder
  - MUST mark off checkboxes as steps in the plan are completed
  - MUST get user's approval for each release step being executed

