{...}: {
  imports = [
    ./hardware-configuration.nix
    ./home-manager.nix
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
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  hardware.bluetooth.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Jakarta";
  system.stateVersion = "24.11";
}
