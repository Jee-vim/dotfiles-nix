with import <nixpkgs> {};
  pkgs.mkShell {
    buildInputs = [
      # scaning web
      # nuclei
      # subfinder
      # searxng
      # tor
      # jq

      python3
      python3Packages.pip
      python3Packages.requests
      # python3Packages.python-binance
      # python3Packages.scikit-learn
      # python3Packages.pandas
      # python3Packages.numpy
      # python3Packages.websockets
      # python3Packages.python-telegram-bot
      # python3Packages.python-dotenv

      # python3Packages.solana
      python3Packages.base58
      # python3Packages.eth-account
      # python3Packages.web3
    ];
  }
# NOTE if u have a problem during install package pip
# try adding this
# python -m venv .venv
# source .venv/bin/activate
# pip install <your-package>

