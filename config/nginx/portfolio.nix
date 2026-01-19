{
  services.nginx = {
    enable = true;

    virtualHosts."portfolio.jaenudin.xyz" = {
      root = "/var/www/portfolio";

      extraConfig = ''
        try_files $uri $uri/ /index.html;
      '';
    };
  };
}
