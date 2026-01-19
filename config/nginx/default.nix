{secrets, ...}: {
  imports = [
    ./portfolio.nix
  ];
  security.acme = {
    acceptTerms = true;
    defaults.email = secrets.email;
  };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
