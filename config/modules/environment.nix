{pkgs, ...}: {
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  environment.variables = {
    WLR_NO_HARWARE_CURSORS = "1";
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    DISCORD_USE_WAYLAND = "0";
  };

  programs.nix-ld.enable = true;
}
