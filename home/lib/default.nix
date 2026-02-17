{lib, ...}: {
  # Centralized configuration access
  settings = import ../settings.nix;

  # Helper functions
  mkIfAttr = attr: value: lib.mkIf (lib.hasAttr attr settings) value;
}
