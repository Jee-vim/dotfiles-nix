{pkgs, ...}: {
  systemd.services.pm2 = {
    description = "PM2 proccess manager";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    environment = {
      HOME = "/home/jee";
      PM2_HOME = "/home/jee/.pm2";
    };
    serviceConfig = {
      Type = "forking";
      User = "jee";
      RemainAfterExit = true;
      ExecStart = "${pkgs.pm2}/bin/pm2 resurrect";
      ExecStop = "${pkgs.pm2}/bin/pm2 kill";
    };
  };
}
