# AI Claude Code Steps

I have been using [Claude Code](https://www.anthropic.com/claude-code) to help
me develop software projects. I have found that using **Claude Code** can help
me be more productive. However, I have also found that using **Claude Code** can
be challenging if I do not have a clear plan, and an environment and 
structure setup for my project. 

I have created this project to share the steps that I follow.

## Some of the reasons I like `Claude Code`

- Provide the "plan mode" which allows me to more easily have plans created,
  reviewed, and saved prior to execution.
- Provides support for running commands in the background.
- Provides support for "custom slash commands" which allows me to create routine
  repetive commands in prompt files.
- It is easy to switch in and and out of plan mode, background mode, and edits
  mode.
 

## Tips

1. The success of your project is highly correlated to the planning you do
   upfront. You should plan to have good and concise documentation in the
   project and in the default ~/.claude directory.
2. Make use of custom slash commands for repetitive tasks, like creating a
   component implementation plan and executing it.
3. Do NOT fully trust Claude Code to pick frameworks, and main libraries for
   your project. It is best to do upfront exploration of libraries, frameworks,
   and tools to add to the project `design/TECHNOLOGY_STACK.md` file.
4. Do NOT fully trust Claude Code to fully design your components. It is best to
   do a high level description of the main components and place them in the
   `design/COMPONENTS.md` file.
5. If possible provide the model with some existing code.  This will help 
   the LLM to:
    - match your coding style
    - find code patterns
    - find libraries and packages you use
6. Include `LLMs.txt` documentation in the project:
    - [llms.txt](https://llmstxt.org/)
7. Ask the model to plan and think first
8. Provide good prompts. Below are some examples:
    - You are an expert software developer...


## Step 1: Scaffold Project

I start with a well-defined scaffolded project that makes proper use of source
code structures, and build/dependency management tools. I use `poetry` to
scaffold Python projects, and `gradle` to scaffold Java/Kotlin projects.

## Step 2: CLAUDE.md, CLAUDE_JAVA.md and CLAUDE_PYTHON.md

I have
created [CLAUDE.md](claude/CLAUDE.md), [CLAUDE_JAVA.md](claude/CLAUDE_JAVA.md),
and [CLAUDE_PYTHON.md](claude/CLAUDE_PYTHON.md) files that I store in my ~
/.claude directory locally.

## Step 3: Custom Slash Commands

I have created custom slash commands [here](claude/commands) that I store in
my ~/.claude/commands directory locally.

## Step 4: Think About the Project

Now it is the time to think about where you are going with the project. What are
you trying to build? What is the problem you are trying to solve? What are the
requirements? What are the constraints? What are the assumptions? What are the
risks? What are the dependencies? What are the milestones? What are the
deliverables? What are the success criteria?

## Ste 5: Document Project Description in README.md

At this stage, I write a high-level project description, goals, and assumption
in the introductory section of the project README.md file.

## Step 6: Create a Project `design/TECH_STACK.md` File

I create a `design/TECHNOLOGY_STACK.md` file in the project. In this file, I
describe the main libraries, frameworks, and tools for my project. This file will
be used by Claude Code to help in making a plan to implement each component.

## Step 7: Create a Project `design/COMPONENTS.md` File

I create a `design/COMPONENTS.md` file in the project. In this file, I describe
the high-level of each component I envision for the. Notice that by component I
mean a class, or a set of related classes that work together to provide a
specific functionality in the system.

This file will be used by Claude Code when making an implementation plan.

## Step 8: Component Implementation Plan and Execution

At this stage, I use the custom slash command `component-plan` along with the
name of the component found in the `design/COMPONENTS.md` file. Then, I review
and make any change suggestions to the implementation plan that Claude Code
created. After I accept the plan, I ensure the plan is stored in teh projects
`tasks` folder, and I approve the execution of the plan.

I do this stage for each component found in the `design/COMPONENTS.md` file. I
then validate the tests are passing, and make any suggestions of new
tests/changes if necessary.

### Step 9: Git Commit

Once I feel satisfied with the implementation of the component, I do a git
commit with a message that describes what was done.

### Step 10: Iterate

I now iterate over Steps 7, 8, 9, and 10 until I feel the project is complete.

---
Author:  [Rubens Gomes](https://rubensgomes.com/)

