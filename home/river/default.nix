{pkgs, ...}: {
  # River 0.3.x via the maintained "river-classic" fork, built against the
  # system mesa (has the iris DRI drivers). The previous pin to nixpkgs-24.11's
  # river 0.3.7 linked a headless mesa with NO DRI drivers, so it could not
  # create an EGL renderer and died with "RendererCreateFailed". river-classic
  # keeps the riverctl/rivertile 0.3.x workflow, so the init below is unchanged.
  home.packages = [
    pkgs.river-classic  # river compositor + riverctl + rivertile
    pkgs.swaybg         # wallpaper (compositor-agnostic)
    pkgs.hyprlock       # lock screen (wlroots-agnostic)
  ];

  # River init script — mirrors the old hyprland look/behavior.
  xdg.configFile."river/init" = {
    executable = true;
    text = builtins.readFile ./init;
  };
}
