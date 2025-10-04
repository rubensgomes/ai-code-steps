# Component Plan Command

1. If no argument is provided, respond with "Error: No component name provided."
2. Re-read the project design/COMPONENTS.md file.
3. If the argument provided does not match any component in the project
   design/COMPONENTS.md file, respond with "Error: Component '#$ARGUMENT' not
   found in project design/COMPONENTS.md file."
4. Create a detailed implementation plan to implement the #$ARGUMENT component
   described in the project design/COMPONENTS.md file.
5. The plan should provide the reasoning behind each step.
6. The plan should be broken down into small, manageable tasks with checkboxes.
7. After creating the plan, check in with me for plan approval.
8. MUST write the plan in Markdown format to the tasks/plan_#$ARGUMENT.md file.
9. MUST NOT start executing the plan until it is approved and stored in the
   project tasks/plan_#$ARGUMENT.md file.

Remember to use all the coding guidelines and instructions provided in the
CLAUDE.md files. 