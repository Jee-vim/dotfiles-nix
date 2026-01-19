{
  services.nginx.virtualHosts = {
    "localhost" = {
      # enabled when have custom domain
      # enableACME = true;
      # forceSSL = true;
      root = "/var/www/portfolio";
    };

    # "portfolio" = {
    #   # enableACME = true;
    #   # forceSSL = true;
    #   root = "/var/www/portfolio";
    # };
  };
}
