{
  services.nginx.virtualHosts = {
    "localhost" = {
      # enabled when have custom domain
      # enableACME = true;
      # forceSSL = true;
      root = "/var/www/portfolio";
    };

    # "blog.example.com" = {
    #   enableACME = true;
    #   forceSSL = true;
    #   root = "/var/www/blog";
    # };
  };
}
