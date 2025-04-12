{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # CLI Utilities
    v4l-utils
    ripgrep
    wget
    fastfetch
    htop
    htop-vim
    btop

    # Clipboard & Screenshot Tools
    wl-clipboard
    hyprshot

    # Audio Management
    pulseaudioFull # cli
    pavucontrol # gui

    # Development Tools
    nodejs_22
    pnpm_10
    lua-language-server
    typescript-language-server

    # File System & Compatibility
    pkgs.nix-ld # Compatibility layer for dynamic linking in Nix

    # Applications
    postman
    brave
    telegram-desktop
  ];
}
