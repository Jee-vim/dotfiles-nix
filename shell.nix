with import <nixpkgs> {};
pkgs.mkShell {
  buildInputs = [
    python3
    python3Packages.pip
    python3Packages.requests
    python3Packages.websockets
    python3Packages.loguru
  ];
}
