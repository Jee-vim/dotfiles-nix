let
  settings = import ../../settings.nix;
in {
  monitor = [
    "${settings.monitor.internal},preferred,0x0,auto"
    "${settings.monitor.external},preferred,1920x0,auto"
  ];

  env = [
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_SIZE,24"
  ];

  exec-once = [
    "hypridle"
    "hyprpaper"
    "swaync"
    "brave"
    "kitty"
    "systemctl --user set-environment GTK_THEME=Arc-Dark"
    "systemctl --user set-environment QT_STYLE_OVERRIDE=Arc-Dark"
    "gsettings set org.gnome.desktop.interface color-scheme prefer-dark"
    "systemctl --user restart xdg-desktop-portal" # Ensures portal services are running
  ];

  # layerrule = [
  #   "blur, swaync-control-center"
  #   "ignorezero, swaync-notification-window"
  #   "animation slide top, swaync-control-center"
  # ];

  general = {
    gaps_in = 5;
    gaps_out = 7;
    border_size = 2;
    resize_on_border = true;
    allow_tearing = false;
    layout = "dwindle";
  };

  decoration = {
    rounding = settings.style.rounded;
    active_opacity = 1.0;
    inactive_opacity = 1.8;
    blur = {
      enabled = true;
      size = 8;
      passes = 1;
      vibrancy = 0.1000;
    };
  };

  input = {
    kb_layout = "us";
    follow_mouse = 2;
    sensitivity = 0;
    touchpad.natural_scroll = false;
  };

  gestures.workspace_swipe = true;

  animations = {
    enabled = true;
    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  misc = {
    force_default_wallpaper = 0;
    disable_hyprland_logo = true;
  };

  binds = import ./binds.nix;
}
