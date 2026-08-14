{
  description = "my flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # River 0.3.x is provided by pkgs.river-classic (maintained fork) from the
    # main nixpkgs above, built against the system mesa. No separate pin needed.
  };
  outputs = {
    nixpkgs,
    zig,
    zls,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    packages.${system} = {
      zig = zig.packages.${system}.master;
      zls = zls.packages.${system}.default;
    };
    nixosConfigurations = {
      jee = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [./config/configuration.nix];
      };
    };
  };
}
