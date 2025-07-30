with import <nixpkgs> {};
  pkgs.mkShell {
    buildInputs = [
      python3
      python3Packages.pip
      python3Packages.requests
      python3Packages.python-binance
      # python3Packages.ta
      python3Packages.pandas
      python3Packages.numpy
      python3Packages.websockets
      python3Packages.python-telegram-bot
      python3Packages.python-dotenv
    ];
  }
# NOTE if u have a problem during install package pip
# try adding this
# python -m venv .venv
# source .venv/bin/activate
# pip install <your-package>

