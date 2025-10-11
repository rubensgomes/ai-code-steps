---
description: Generates an implementation plan for a component in the project.
argument-hint: Name of component.
---

# Generate Component Plan Command

1. If no argument is provided, respond with "Error: No component provided."
2. Read and load the project @design/COMPONENTS.md file.
3. If the argument provided does not match any component in the 
   `design/COMPONENTS.md`, respond with "Error: Component '$ARGUMENT' not
   found in project `design/COMPONENTS.md` file."
4. Show your understanding of the $ARGUMENT component.
5. Create a detailed implementation plan for the $ARGUMENT component.
6. The plan should provide the reasoning behind each step.
7. The plan should be broken down into small, manageable tasks with checkboxes.
8. **MUST** save the plan in the project `misc/tasks/PLAN_$ARGUMENT.md`.
9. Do not back up previous files; overwrite them.

Remember to use all the coding guidelines and instructions provided before.
