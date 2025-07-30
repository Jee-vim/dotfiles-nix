{pkgs, ...}: let
  package = import ./package.nix {inherit pkgs;};
  setting = import ./settings.nix;
in {
  imports = [
    ./hyprland
    ./terminal
    ./rofi
    ./cursor.nix
    ./qutebrowser
  ];

  home.username = setting.user.username;
  home.homeDirectory = "/home/${setting.user.username}";
  home.packages = package;
  dconf.enable = true;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
