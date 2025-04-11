{
  imports = [
    ./programs/hypridle.nix
    ./programs/hyprlock.nix
    ./programs/hyprpaper.nix
    ./programs/swaync.nix
    ./programs/wofi.nix
    ./config/rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = import ./config/settings.nix;
  };
}
