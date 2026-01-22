{secrets, ...}: let
  style = import ../settings.nix;
in {
  programs.git = {
    enable = true;
    userName = "${style.user.name}";
    # userEmail = "${secrets.email}";
    extraConfig = {
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
      "node_modules"
    ];
  };
}
