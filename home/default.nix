{...}: {
  imports = [
    ./hyprland
    ./terminal
    ./rofi
    ./cursor.nix
    ./package.nix
  ];

  home.username = "jee";
  home.homeDirectory = "/home/jee";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
