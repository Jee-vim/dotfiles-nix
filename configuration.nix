{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./system-package.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Nix";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Asia/Jakarta";

  users.users.jee = {
    isNormalUser = true;
    home = "/home/jee";
    description = "Jee";
    extraGroups = ["wheel" "networkmanager"];
  };

  security.sudo.extraRules = [
    {
      users = ["jee"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.geist-mono
    pkgs.nerd-fonts.cousine
    pkgs.nerd-fonts.iosevka
  ];

  programs.nix-ld.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  hardware.graphics.enable = true;
  # services.udev.packages = with pkgs; [v4l-utils];

  environment.variables = {
    WLR_NO_HARWARE_CURSORS = "1";
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  services.ollama.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.openssh.enable = true;

  system.stateVersion = "24.11";
}
