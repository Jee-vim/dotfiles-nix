{pkgs, ...}: let
  binds = import ./config/binds.nix;
in {
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    settings = binds;
    extraConfig = ''
      ${pkgs.rivertile}/bin/rivertile -view-padding 6 -outer-padding 6 &
    '';
  };
}
