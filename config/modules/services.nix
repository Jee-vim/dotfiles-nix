{pkgs, ...}: {
  services.ollama.enable = true;
  services.cron.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.openssh.enable = false;
  services.dbus.packages = with pkgs; [dconf];
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
}
