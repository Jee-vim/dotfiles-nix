{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    #  Global bash script
    (writeScriptBin "nix-clean" (builtins.readFile ../home/script/cleanup.sh))
    (writeScriptBin "nix-clean-node" (builtins.readFile ../home/script/cleanup-node.sh))
    (writeScriptBin "powermenu" (builtins.readFile ../home/script/powermenu.sh))
    (writeScriptBin "volume" (builtins.readFile ../home/script/volume.sh))
    (writeScriptBin "brightness" (builtins.readFile ../home/script/brightness.sh))
    (writeScriptBin "screenshots" (builtins.readFile ../home/script/screenshot.sh))

    # CLI Utilities
    cron
    ripgrep
    nh
    wget
    fastfetch
    htop
    htop-vim
    btop
    openconnect
    gcc
    dconf
    libnotify
    pamixer
    brightnessctl
    wl-clipboard
    zip
    unzip
    p7zip
    gzip
    bzip2
    file
    pm2
    wlroots # Wayland support
    xdg-desktop-portal-hyprland # Portal screen sharing
    wf-recorder # Opsional, alternatif record for Wayland
    gst_all_1.gstreamer # OBS feature
    v4l-utils # virtual camera support
    bluetui

    # Audio Management
    pulseaudioFull # cli
    pavucontrol # gui

    # Development Tools
    neovim
    python3
    nodejs_22
    pnpm
    lua-language-server
    typescript
    typescript-language-server
    lua-language-server
    astro-language-server
    vue-language-server
    # docker-compose
    nixd # nix lang server
    alejandra # nix formatter
    inputs.zig.packages.${pkgs.system}."0.16.0"
    inputs.zls.packages.${pkgs.system}.default

    # File System & Compatibility
    pkgs.nix-ld # Compatibility layer for dynamic linking in Nix
  ];
}
