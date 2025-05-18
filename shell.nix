with import <nixpkgs> {};
  pkgs.mkShell {
    buildInputs = [
      python3
      python3Packages.pip
      python3Packages.requests
      # python3Packages.websockets
      # python3Packages.loguru
      # python3Packages.flask
      # python3Packages.crewai
      # python3Packages.gunicorn
      # python3Packages.flask-cors
    ];
  }
# NOTE if u have a problem during install package pip
# try adding this
# python -m venv .venv
# source .venv/bin/activate
# pip install <your-package>

