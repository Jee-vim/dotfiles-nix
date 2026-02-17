{lib, ...}: let
  settings = import ../../home/settings.nix;
in {
  users.users.${settings.user.username} = {
    isNormalUser = true;
    home = settings.homeDir;
    description = settings.user.username;
    extraGroups = ["wheel" "networkmanager" "dialout" "docker"];
  };

  security.sudo.extraRules = [
    {
      users = [settings.user.username];
      commands = [{ command = "ALL"; }];
    }
  ];
}
