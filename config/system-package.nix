{
  pkgs,
  inputs,
  ...
}: {
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
    dconf
    libnotify
    pamixer
    brightnessctl
    wl-clipboard

    # Audio Management
    pulseaudioFull # cli
    pavucontrol # gui

    # Development Tools
    neovim
    nodejs_22
    nodePackages.pnpm
    lua-language-server
    typescript
    typescript-language-server
    lua-language-server
    nodePackages.vscode-langservers-extracted
    docker-compose
    nil # nix lang server
    alejandra # nix formatter
    inputs.zig.packages.${pkgs.system}."0.15.1"
    inputs.zls.packages.${pkgs.system}.default

    # Applications
    postman
    discord-ptb

    # File System & Compatibility
    pkgs.nix-ld # Compatibility layer for dynamic linking in Nix
  ];
}
