---
description: Exectutes tests for a component in the project.
argument-hint: Name of component.
---

# Test Component Command

1. If no argument is provided, respond with "Error: No component name provided."
2. If the $ARGUMENT is not a valid component name, respond with "Error: 
   Invalid $ARGUMENT component name."
3. If the argument is a valid component name, proceed to step 4.
4. **Execute tests and capture output** for the $ARGUMENT component.
5. **Analyze results**, then provide a summary of the overall coverage
   percentage, and note any significant changes or areas needing improvement.
6. **Store** the summary you generated in the project `misc/tests_cov/$ARGUMENT`.
7. Do not back up previous plan files; overwrite them.
