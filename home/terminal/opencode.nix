{
  programs.opencode = {
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      theme = "gruvbox";
      disabled_providers = ["openai"];

      keybinds = {
        command_list = "ctrl+l";
        messages_page_up = "ctrl+gg";
        messages_page_down = "ctrl+G";
        input_newline = "ctrl+return,alt+return,ctrl+j";
      };

      watcher = {
        ignore = ["node_modules/**" "dist/**" ".git/**" ".env"];
      };

      instructions = [
        "CONTRIBUTING.md"
        "RULES.md"
        "GUIDE.md"
        "docs/guidelines.md"
        ".cursor/rules/*.md"
      ];

      compaction = {
        auto = true;
        prune = true;
      };

      tools = {
        read = true;
        grep = true;
        webfetch = true;
        glob = true;
        list = true;
        todowrite = true;
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
        code-reviewer = {
          description = "Reviews code for security, performance, and maintainability.";
          prompt = "You are a code reviewer. Identify bottlenecks, security vulnerabilities (like SQLi or XSS), and suggest more readable alternatives.";
        };
        ux-advisor = {
          description = "Frontend/UI specialist for accessibility and user flow.";
          prompt = "You are a UX advisor. Evaluate UI code for WCAG accessibility, responsive design, and consistent spacing/theming.";
        };
        test-engineer = {
          description = "Generates test cases and improves coverage.";
          prompt = "You are a test engineer. Suggest edge cases and write test suites using Jest, Vitest, or Pytest. Focus on mocking external dependencies.";
          tools = {
            write = true;
            edit = true;
          };
        };
        style-enforcer = {
          description = "Maintains team coding standards.";
          prompt = "You are a style enforcer. Verify naming conventions (camelCase for JS, snake_case for Python) and ensure consistent file structures.";
        };
      };
    };
  };
}
