{pkgs, ...}: {
  services.flatpak.enable = true;
  services.ollama.enable = false;
  services.cron.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };
  services.dbus.packages = with pkgs; [dconf];
  services.blueman.enable = true;
  services.tlp.enable = true;

  systemd.services.tlp-dynamic-thresholds = {
    description = "Dynamically set TLP battery thresholds based on hardware limits";
    before = ["tlp.service"];
    wantedBy = ["multi-user.target"];
    path = [pkgs.tlp pkgs.gawk pkgs.gnugrep];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "tlp-dynamic-init" ''
        # Extract min start threshold and max stop threshold
        START_LIMIT=$(tlp-stat -b | awk '/START_CHARGE_THRESH_BAT0.*:/ {print $3}' | cut -d'.' -f1)
        STOP_LIMIT=$(tlp-stat -b | awk '/STOP_CHARGE_THRESH_BAT0.*:/ {print $3}' | cut -d'.' -f2 | cut -d'(' -f1)

        # Fallback values if parsing fails
        START_LIMIT=''${START_LIMIT:-50}
        STOP_LIMIT=''${STOP_LIMIT:-90}

        [INFO] Applying dynamic hardware thresholds: Start at $START_LIMIT%, Stop at $STOP_LIMIT%
        tlp setcharge $START_LIMIT $STOP_LIMIT BAT0
      '';
    };
  };
}
