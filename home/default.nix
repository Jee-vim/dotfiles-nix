{pkgs, ...}: let
  package = import ./package.nix {inherit pkgs;};
  setting = import ./settings.nix;
in {
  imports = [
    ./hyprland
    ./terminal
    ./qutebrowser
    ./rofi
    ./theme.nix
    ./cursor
    ./waybar
  ];

  home.username = setting.user.username;
  home.homeDirectory = setting.homeDir;
  home.packages = package;
  dconf.enable = true;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
