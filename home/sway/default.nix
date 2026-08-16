{pkgs, ...}: {
  home.packages = with pkgs; [
    sway
    swaybg
    swaylock
    swayidle
  ];

  xdg.configFile."sway/config" = {
    executable = true;
    text = builtins.readFile ./config;
  };
}
