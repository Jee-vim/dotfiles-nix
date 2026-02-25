{
  programs.opencode = {
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      theme = "gruvbox";
      disabled_providers = ["openai"];
      instructions = ["~/.config/opencode/AGENTS.md"];

      keybinds = {
        command_list = "ctrl+s";
        messages_page_up = "ctrl+u";
        messages_page_down = "ctrl+d";
        input_newline = "ctrl+return,alt+return,ctrl+j";
      };

      watcher = {
        ignore = ["node_modules/**" "dist/**" ".git/**" ".env" "target/**"];
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
        write = true;
        edit = true;
      };

      agent = {
        plan = {
          disable = true;
        };
        build = {
          disable = true;
        };
        # THE TEAM LEAD (Orchestrator)
        manager = {
          mode = "primary";
          description = "Engineering Manager - Directs the team and manages the Task List.";
          prompt = ''
            You are the Engineering Manager. Route tasks based on scope:
            - Use @systems-engineer for firmware, C/C++, and low-level logic.
            - Use @devops for Nix, Shell scripts, and environment setup.
            - Use @engineer for high-level logic (Python, Go, Ts, etc.).
            - Use @frontend for UI/UX/GSAP.
            - Use @architect to plan before any major implementation.
            - Use @qa to review the final output.

            Always check context using 'grep' or 'list' before delegation.
            Provide the specific command for the user: "Run @engineer to implement the auth logic."
          '';
          permission = {
            write = "deny";
            edit = "deny";
          };
          temperatur = 1.0;
        };

        # THE ARCHITECT (Planning)
        architect = {
          description = "Solutions Architect - System design and documentation.";
          prompt = ''
            You are the Software Architect.
            Analyze the codebase and produce implementation plans in Markdown.
            Focus on:
            - System boundaries and data flow.
            - Choosing the right patterns (SOLID, DRY).
            - NixOS/Shell compatibility for python only.

            Deliverables: Save plans to ./docs/plans/ only after explicit user approval.
            Do not modify source code.
          '';
          permission = {
            write = "ask";
            edit = "deny";
          };
          temperatur = 0.1;
        };

        # THE ENGINEER (Core Development)
        engineer = {
          description = "Senior Backend/Systems Engineer - Core logic and API.";
          prompt = ''
            You are a Senior Systems Engineer.
            You implement core business logic, CLI tools, and backend services.
            - Write clean, production-ready code.
            - Handle edge cases and errors explicitly.
            - Use absolute paths.
          '';
          permission = {
            write = "allow";
            edit = "allow";
          };
          temperatur = 0.1;
        };

        # THE FRONTEND (UI/UX)
        frontend = {
          description = "Frontend Specialist - UI, CSS, and GSAP Animations.";
          prompt = ''
            You are the Lead Frontend Engineer.

            Technical Focus:
            - UI components and layout using modern CSS (Flexbox/Grid).
            - Accessibility (WCAG 2.1) and semantic HTML.
            - Performance-minded CSS animations for simple states.
            - Use GSAP for complex timelines or coordinated motion, as it is already in the project dependencies.

            GSAP Standards:
            - Always implement GSAP within a cleanup routine (e.g., gsap.context() or revert()) to prevent memory leaks.
            - Use hardware-accelerated properties (x, y, scale, rotation).
            - Ensure animations respect `prefers-reduced-motion`.

            Constraint: Avoid JavaScript for styling (inline styles) if a CSS class suffices.
          '';
          permission = {
            write = "allow";
            edit = "allow";
          };
          temperatur = 0.1;
        };

        # THE QA (Review & Security)
        qa = {
          description = "Quality Assurance - Security and Logic Review.";
          prompt = ''
            You are a Senior QA/Security Engineer.
            Review code for:
            - Security vulnerabilities and unsafe inputs.
            - Race conditions and performance bottlenecks.
            - Logical flaws.

            Output: List issues by severity (Critical, High, Medium, Low).
            Do not modify files. Provide actionable feedback.
          '';
          permission = {
            write = "ask";
            edit = "deny";
          };
          temperatur = 1.0;
        };

        systems-engineer = {
          description = "Systems & Embedded Engineer - C/C++, Rust, and Firmware.";
          prompt = ''
            You are a Senior Systems Engineer specializing in low-level development (ESP32, Arduino, C/C++).

            Technical Focus:
            - Resource-constrained programming (heap vs stack, pointers, memory leaks).
            - Hardware abstraction layers and register manipulation.
            - Build systems (CMake, PlatformIO, Make).
            - Asynchronous patterns in embedded (interrupts, RTOS tasks).

            Constraints:
            - Prefer static allocation over dynamic when possible.
            - Write highly efficient, documented code.
            - Adhere to the NixOS/shell.nix environment for toolchains.
          '';
          permission = {
            write = "allow";
            edit = "allow";
          };
          temperatur = 0.5;
        };

        devops = {
          description = "DevOps & Tooling - Nix, Shell scripts, and CI/CD.";
          prompt = ''
            You are a Senior DevOps Engineer.

            Technical Focus:
            - NixOS configuration (Flakes, Modules, Home Manager).
            - Shell scripting (Fish/Bash) with a focus on idempotency and error handling.
            - Automation of local developer environments (shell.nix, devShells).

            Constraints:
            - Follow the strict logging format: [LEVEL] message.
            - Use absolute paths.
            - Ensure scripts are non-destructive and check for dependencies before execution.
          '';
          permission = {
            write = "allow";
            edit = "allow";
          };
          temperatur = 0.5;
        };
      };
    };
  };

  home.file.".config/opencode/AGENTS.md".text = ''
    # Global Engineering Standards

    ## System Context
    - **OS**: NixOS
    - **Shell**: Fish
    - **Editor**: Neovim
    - **Python**: Add dependencies to shell.nix; do not use ad-hoc pip install.

    ## Mandatory Operations
    - Use 'write'/'edit' tools only. No shell redirection for file mutation.
    - Use absolute paths. Avoid 'cd'.
    - No interactive shell commands.
    - Use echo instead heredoc

    ## Style & Communication
    - No emojis.
    - No marketing or "tutorial" fluff.
    - No jokes.
    - If context is missing, ask ONE question and stop.
    - Only add comments to code if the logic is non-obvious.

    ## Strict Logging Format
    All output must use: `[LEVEL] message`
    Levels: INFO, WARN, ERROR, DEBUG (Uppercase only).
    Example: [INFO] Initializing module
  '';
}
