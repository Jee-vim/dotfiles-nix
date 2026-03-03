{
  programs.opencode = {
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      theme = "gruvbox";
      disabled_providers = ["openai"];
      instructions = [
        "~/.config/opencode/AGENTS.md"
        "~/.config/opencode/rules/common/development-workflow.md"
        "~/.config/opencode/rules/common/coding-style.md"
        "~/.config/opencode/rules/common/git-workflow.md"
      ];

      keybinds = {
        command_list = "ctrl+s";
        messages_page_up = "ctrl+u";
        messages_page_down = "ctrl+d";
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

    };
  };

  home.file.".config/opencode/AGENTS.md".source =
    ./AGENTS.md;
  home.file.".config/opencode/commands".source = ./commands;
  home.file.".config/opencode/contexts".source = ./contexts;
  home.file.".config/opencode/hooks".source = ./hooks;
  home.file.".config/opencode/rules".source = ./rules;
  home.file.".config/opencode/agent".source = ./agent;
  home.file.".config/opencode/skills".source = ./skills;
}
