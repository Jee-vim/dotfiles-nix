{pkgs}:
with pkgs; [
  swaynotificationcenter
  hyprpaper
  feh
  nautilus
  inkscape
  libnotify
  pamixer
  brightnessctl
  xfce.thunar
  xfce.thunar-archive-plugin
  xfce.thunar-volman

  nmap
  tshark
  bettercap
  # sqlmap
  # nmap
  # lynx
  # nuclei
  # httprobe
  # nikto

  # Recording and Share Screen
  obs-studio
  wlroots # Wayland support
  xdg-desktop-portal-hyprland # Portal screen sharing
  wf-recorder # Opsional, alternatif record for Wayland
  gst_all_1.gstreamer # fitur OBS
  v4l-utils # virtual camera support
  mpv # video player
]
