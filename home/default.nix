{pkgs, ...}: {
  imports = [
    ./hyprland
    ./terminal
    ./cursor.nix
    ./rofi.nix
  ];

  home.username = "jee";
  home.homeDirectory = "/home/jee";

  home.packages = with pkgs; [
    neovim
    gcc

    swaynotificationcenter
    hyprpaper
    feh
    nautilus

    nil # nix lang server
    alejandra # nix formatter

    sqlmap
    nmap
    lynx
    nuclei
    httprobe
    nikto # web scanner

    firefox

    # Recording and Share Screen
    obs-studio
    wlroots # Wayland support
    xdg-desktop-portal-hyprland # Portal screen sharing
    wf-recorder # Opsional, alternatif record for Wayland
    gst_all_1.gstreamer # fitur OBS
    v4l-utils # virtual camera support
    mpv # video player
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
