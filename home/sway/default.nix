{pkgs, ...}: {
  home.packages = with pkgs; [
    sway
  ];

  xdg.configFile."sway/config" = {
    executable = true;
    text = builtins.readFile ./config;
  };
}
