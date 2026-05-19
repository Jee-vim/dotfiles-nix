{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
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

    # File System & Compatibility
    pkgs.nix-ld # Compatibility layer for dynamic linking in Nix
  ];
}
