let
  settings = import ../../settings.nix;
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      # You no longer need the "preload" array at all with the new syntax!
      
      wallpaper = [
        {
          monitor = "${settings.monitor.internal}";
          path = "${settings.image.internal}";
        }
        {
          monitor = "${settings.monitor.external}";
          path = "${settings.image.external}";
        }
      ];
      
      ipc = false;
      splash = true;
      splash_offset = 20;
    };
  };
}
