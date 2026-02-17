{pkgs, ...}: {
  systemd.services.pm2 = {
    description = "PM2 process manager";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "forking";
      User = "jee";

      Environment = [
        "PM2_HOME=/home/jee/.pm2"
        "PATH=${pkgs.nodejs}/bin:${pkgs.pm2}/bin"
      ];

      ExecStart = "${pkgs.pm2}/bin/pm2 resurrect";
      ExecReload = "${pkgs.pm2}/bin/pm2 reload all";
      ExecStop = "${pkgs.pm2}/bin/pm2 kill";

      Restart = "on-failure";
      LimitNOFILE = "infinity";
    };
  };
}
