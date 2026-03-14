let
  settings = import ../../settings.nix;
in {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "match:class ^(imv)$, float on"
      "match:class ^(mpv)$, float on"
      "match:class ^(SoundWireServer)$, float on"
      "match:class ^(.sameboy-wrapped)$, float on"
      "match:class ^(org.pulseaudio.pavucontrol)$, float on"

      "match:class ^(rofi)$, pin on"


      "match:class ^(SoundWireServer)$, size 725 330"

      "match:title ^(Volume Control)$, size 700 450"
      "match:title ^(Volume Control)$, move 40 55%"

      "match:title ^(Picture-in-Picture)$, pin on"
      "match:title ^(Picture-in-Picture)$, float on"

      "match:class ^(zen-beta)$, workspace 1"
      "match:class ^(Aseprite)$, workspace 4"
      "match:class ^(Audacious)$, workspace 5"
      "match:class ^(com.obsproject.Studio)$, workspace 8"
      "match:class ^(discord)$, workspace 10"
      "match:class ^(WebCord)$, workspace 10"
      "match:class ^(vesktop)$, workspace 10"

      "match:class ^(mpv)$, idle_inhibit focus"

      "match:class ^(xdg-desktop-portal-gtk)$, dim_around on"

      "match:xwayland true, rounding 0"

      # No gaps when only
      "border_size 0, match:float 0, match:workspace w[tv1]"
      "rounding 0, match:float 0, match:workspace w[tv1]"
      "border_size 0, match:float 0, match:workspace f[1]"
      "rounding 0, match:float 0, match:workspace f[1]"
    ];

    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
      "1, monitor:${settings.monitor.internal}"
      "2, monitor:${settings.monitor.internal}"
      "3, monitor:${settings.monitor.internal}"
      "4, monitor:${settings.monitor.internal}"
      "5, monitor:${settings.monitor.external}"
    ];
  };
}
