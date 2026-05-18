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

  nixpkgs.overlays = [
    (self: super: {
      yt-dlp = super.yt-dlp.override {deno = super.bun;};
    })
  ];

  home.username = setting.user.username;
  home.homeDirectory = setting.homeDir;
  home.packages = package;
  dconf.enable = true;

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
