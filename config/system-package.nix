{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # CLI Utilities
    ripgrep
    wget
    fastfetch
    htop
    htop-vim
    btop
    openconnect
    gcc

    # Clipboard & Screenshot Tools
    wl-clipboard
    hyprshot

    # Audio Management
    pulseaudioFull # cli
    pavucontrol # gui

    # Development Tools
    neovim
    nodejs_22
    pnpm_10
    lua-language-server
    typescript
    typescript-language-server
    lua-language-server
    # vscode-css-language-server # CSS, HTML and JSON
    docker-compose
    nil # nix lang server
    alejandra # nix formatter

    # File System & Compatibility
    pkgs.nix-ld # Compatibility layer for dynamic linking in Nix

    # Applications
    postman
    brave
    telegram-desktop
    discord-ptb
  ];
}
