{
  description = "my flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      jee = lib.nixosSystem {
        inherit system;
        modules = [./config/configuration.nix];
      };
    };
    homeConfigurations.jee = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home/default.nix
      ];
      extraSpecialArgs = {inherit inputs;}; # Recommended to pass inputs to HM
    };
  };
}
