{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock || notify-send 'lock!'";
        after_sleep_cmd = "notify-send 'System Awake!'";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          # warn 1 min before shutdown
          timeout = 4140; # 1h10m - 60s
          on-timeout = "notify-send '⚠️ System will shut down in 1 minute!' 'Touch or Type anything to cancel'";
        }
        # {
        #   # shutdown
        #   timeout = 4200; # 1h10m
        #   on-timeout = "poweroff";
        # }
      ];
    };
  };
}
