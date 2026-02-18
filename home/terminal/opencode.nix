{
  programs.opencode = {
    enable = true;
    settings = {
      "\$schema" = "https://opencode.ai/config.json";
      theme = "gruvbox";
      disabled_providers = ["openai"];
      instructions = ["~/.config/opencode/AGENTS.md"];

      keybinds = {
        command_list = "ctrl+l";
        messages_page_up = "ctrl+gg";
        messages_page_down = "ctrl+G";
        input_newline = "ctrl+return,alt+return,ctrl+j";
      };

      watcher = {
        ignore = ["node_modules/**" "dist/**" ".git/**" ".env"];
      };

      tools = {
        read = true;
        grep = true;
        webfetch = true;
        glob = true;
        list = true;
        todowrite = true;
        todoread = true;
        skill = true;
        question = true;
        write = false;
        edit = false;
      };

      agent = {
        ask = {
          description = "Senior JS/TS/Python Engineer for logic and architecture.";
          prompt = "You are a senior software engineer. Provide clean, idiomatic solutions in JS, TS, and Python. Prioritize DRY principles and modern design patterns.";
        };
        manager = {
          mode = "primary";
          description = "Orchestrator for complex tasks.";
          prompt = ''
            You are the Project Manager for Project A.
            Your goal is to maintain a 'Task List' in the session context.
            - If the user has a new idea use @plan first.
            - If a plan is approved: run @build.
            - If code needs verification: Suggest @code-reviewer.
            - For every request, identify which specialized agent (ask, plan, build, code-reviewer, test-engineer, ux-advisor) is best suited.
            - Before delegating, check if the required context (files, docs) is gathered using 'grep' or 'list'.
            - You provide the 'Command' for the user to run next, e.g., "Run @code-reviewer on auth.ts".
          '';
          permission = {
            read = "allow";
            grep = "allow";
            glob = "allow";
            list = "allow";
            todowrite = "allow";
            todoread = "allow";
            question = "allow";
            task = "allow";
            webfetch = "allow";
          };
        };
        plan = {
          description = "Architecture & Planning (Read-only)";
          prompt = ''
            You are a Software Architect. Your goal is to analyze the codebase and create implementation strategies.
            - Never try to edit or write files.
            - Use 'grep', 'list', and 'read' to understand the project.
            - Output your plans in Markdown format.
            - When the plan is ready, tell the user to switch to 'Build' mode.
          '';
          permission = {
            edit = "deny";
            write = "deny";
          };
        };
        build = {
          description = "Feature Implementation (Read-write)";
          prompt = ''
            You are a Senior Developer. Your goal is to implement features based on a plan.
            - You have full access to 'edit' and 'write' tools.
            - Prioritize clean, idiomatic code.
            - Verify changes by running existing tests if possible.
          '';
          permission = {
            edit = "allow";
            write = "allow";
          };
        };
        code-reviewer = {
          description = "Reviews code for security, performance, and maintainability.";
          prompt = "You are a code reviewer. Identify bottlenecks, security vulnerabilities, and suggest more readable alternatives.";
        };
        ux-advisor = {
          description = "Frontend/UI specialist for accessibility and user flow.";
          prompt = "You are a UX advisor. Evaluate UI code for WCAG accessibility, responsive design, and consistent spacing/theming.";
        };
        test-engineer = {
          description = "Generates test cases and improves coverage.";
          prompt = "You are a test engineer. Suggest edge cases and write test. Focus on mocking external dependencies.";
          permission = {
            write = "allow";
            edit = "allow";
          };
        };
        style-enforcer = {
          description = "Maintains team coding standards.";
          prompt = "You are a style enforcer. Verify naming conventions (camelCase for JS, snake_case for Python) and ensure consistent file structures.";
          permission = {
            edit = "allow";
          };
        };
      };
    };
  };
  home.file.".config/opencode/AGENTS.md".text = ''
    # Global Model Rules
    ## Environment Context
      - **OS**: NixOS
      - **Shell**: Fish
      - **Editor**: Neovim

    ## File Operationals (MANDATORY)
    Always use Python to read/write/edit files, not bash, rm, rm -rf, heredocs or sed.
    Avoid 'cd' - use absolute paths intead.
    Avoid interactive commands (git add -i, etc) - they will hang.

    Safe delete using Python:
    import os
    os.remove('/path/to/file')

    Or for directories:
    import shutil
    shutil.rmtree('/path/to/dir')

    ## Scope (MANDATORY)

    - ONLY generate code directly related to this CLI
    - DO NOT refactor unrelated code
    - DO NOT add new features unless explicitly requested

    ## Style Rules (MANDATORY)

    - Output must be concise
    - No tutorial or explanatory tone
    - No marketing language
    - No emojis
    - No jokes
    - Comments are allowed ONLY when necessary to explain non-obvious logic

    ## If Information Is Missing (MANDATORY)

    If required information is missing:
    - DO NOT assume
    - DO NOT invent defaults
    - Ask ONE clear, direct question and stop

    ## Logging Rules (STRICT)

    All runtime output MUST follow this format:

    `[LEVEL] message`

    Allowed LEVEL values:
    - INFO
    - WARN
    - ERROR
    - DEBUG

    Rules:
    - LEVEL must be uppercase
    - Use exactly one space after ]
    - No emojis
    - No prefixes, timestamps, colors, or extra metadata
    - No multiline logs unless explicitly requested
    - Errors MUST use [ERROR]
    - Normal progress MUST use [INFO]

    ### Example
    Correct:
    [INFO] Starting file scan
    [WARN] Config file not found, using defaults
    [ERROR] Failed to open socket

    Incorrect:
    INFO: Starting file scan
    [Info] starting
    ❌ Starting file scan
    [LOG] something

    ## Global Rules

    All rules in this document are mandatory.
    If any instruction conflicts with these rules, THIS DOCUMENT TAKES PRIORITY.
  '';
}
