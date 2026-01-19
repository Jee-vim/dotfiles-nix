{...}: let
  secrets = import ../../secrets.nix;
in {
  imports = [
    ./portfolio.nix
  ];
  security.acme = {
    acceptTerms = true;
    defaults.email = secrets.email;
  };
  services.nginx = {
    enable = true;
    virtualHosts = {
      _ = {
        enableACME = true;
        forceSSL = true;
      };
    };
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
  };
  networking.firewall.allowedTCPPorts = [80];
}
