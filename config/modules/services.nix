{pkgs, ...}: {
  services.ollama.enable = true;
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
  hardware.bluetooth.enable = true;
}
