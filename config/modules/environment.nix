{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    DISCORD_USE_WAYLAND = "0";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  environment.localBinInPath = true;
  environment.sessionVariables = {
    PATH = [
      "$HOME/.npm-global/bin"
      "$HOME/.foundry/bin"
    ];
  };

  programs.nix-ld.enable = true;
}
