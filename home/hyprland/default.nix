{
  imports = [
    # ./programs/hypridle.nix
    ./programs/hyprpaper.nix
    ./config/rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = import ./config/settings.nix;
  };
}
