let
  style = import ../settings.nix;
in {
  programs.git = {
    enable = true;
    userName = "${style.user.name}";
    userEmail = "${style.user.email}";
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
      ".env.local"
      ".next"
      "node_modules"
      "secrets.nix"
    ];
  };
}
