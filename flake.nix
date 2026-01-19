{
  description = "my flake";
  inputs = {
    secrets = {
      url = "path:./secrets.nix";
      flake = false;
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    zig,
    zls,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      zig = zig.packages.${system}."0.15.2";
      zls = zls.packages.${system}.default;
    };
    nixosConfigurations = {
      jee = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          secrets = import inputs.secrets;
        };
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
