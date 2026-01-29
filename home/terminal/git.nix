{...}: let
  style = import ../settings.nix;
in {
  programs.git = {
    enable = true;
    settings = {
      user.name = "${style.user.name}";
      init.defaultBranch = "main";
      color.ui = "auto";
      push = {
        default = "current";
      };
      merge = {
        conflictstyle = "diff3";
        stat = "true";
      };
    };
    ignores = [
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      ".env"
      ".venv"
      ".next"
      "__pycache__"
      "node_modules"
    ];
  };
}
