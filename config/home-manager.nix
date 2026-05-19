{inputs, ...}: let
  setting = import ../home/settings.nix;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager.backupFileExtension = "bak";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {inherit inputs;};
  home-manager.users."${setting.user.username}".imports = [../home];

  nixpkgs.overlays = [
    (self: super: {
      yt-dlp = super.yt-dlp.override {deno = super.bun;};
    })
  ];
}
