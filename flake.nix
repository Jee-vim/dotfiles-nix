{
  description = "my flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    ollama.url = "github:ollama/ollama";
    home-manager = {
      url = "github:nix-community/home-manager";
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
      zig = zig.packages.${system}."0.15.1";
      zls = zls.packages.${system}.dfault;
    };
    nixosConfigurations = {
      jee = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./config/configuration.nix
          inputs.ollama.nixosModules.default
          {
            service.ollama.enable = true;
            # service.ollama.port = 1337;
          }
        ];
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
