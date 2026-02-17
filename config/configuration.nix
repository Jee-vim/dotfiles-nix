{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./system-package.nix
    ./modules/networking.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/environment.nix
    ./modules/services.nix
    ./modules/virtualisation.nix
    ./modules/pm2.nix
    ./modules/graphics.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Jakarta";

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    enableTCPIP = true;
  };

  system.stateVersion = "24.11";
}
