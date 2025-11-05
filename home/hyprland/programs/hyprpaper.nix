let
  settings = import ../../settings.nix;
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${settings.image.internal}"
        "${settings.image.external}"
      ];
      wallpaper = [
        "${settings.monitor.internal},${settings.image.internal}"
        "${settings.monitor.external},${settings.image.external}"
      ];
      ipc = false;
      splash = true;
      splash_offset = 20;
    };
  };
}
