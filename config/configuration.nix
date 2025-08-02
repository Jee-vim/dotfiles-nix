{pkgs, ...}: let
  setting = import ../home/settings.nix;
in {
  imports = [
    ./hardware-configuration.nix
    ./system-package.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "Nix";
    nameservers = ["127.0.0.1"];
    firewall = {
      enable = false;
      # Block all incoming traffic by default
      # rejectPackets = true;
    };
    networkmanager = {
      enable = true;
      dns = "none"; # Prevent NetworkManager from overriding DNS
      plugins = with pkgs; [
        networkmanager-fortisslvpn
        networkmanager-iodine
        networkmanager-l2tp
        networkmanager-openconnect
        networkmanager-openvpn
        networkmanager-vpnc
        networkmanager-sstp
      ];
    };
  };
  # services.tor = {
  #   enable = true;
  #   client.enable = true;
  #   client.transparentProxy.enable = true; # Redirects all traffic
  # };
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      server_names = ["cloudflare" "quad9-dnscrypt-ip4-filter-pri" "mullvad-adblock-doh"];
    };
  };

  time.timeZone = "Asia/Jakarta";

  virtualisation.docker.enable = true;
  users.users.jee = {
    isNormalUser = true;
    home = "/home/${setting.user.username}";
    description = setting.user.username;
    extraGroups = ["wheel" "networkmanager" "docker"];
  };

  security.sudo.extraRules = [
    {
      users = [setting.user.username];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.sauce-code-pro
      nerd-fonts.geist-mono
      nerd-fonts.commit-mono
      nerd-fonts.iosevka
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["SauceCodePro Nerd Font"];
        sansSerif = ["SauceCodePro Mono Nerd Font"];
        monospace = ["Geist Mono Nerd Font"];
      };
    };
  };

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
  services.dbus.packages = with pkgs; [dconf];

  system.stateVersion = "24.11";
}
