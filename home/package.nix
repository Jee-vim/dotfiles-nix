{pkgs}:
with pkgs; [
  swaynotificationcenter
  hyprpaper
  hyprshot
  xfce.thunar
  xfce.thunar-archive-plugin
  xfce.thunar-volman

  # Recording and Share Screen
  obs-studio
  wlroots # Wayland support
  xdg-desktop-portal-hyprland # Portal screen sharing
  wf-recorder # Opsional, alternatif record for Wayland
  gst_all_1.gstreamer # fitur OBS
  v4l-utils # virtual camera support
  mpv # video player

  # Applications
  brave
  telegram-desktop
  inkscape
]
