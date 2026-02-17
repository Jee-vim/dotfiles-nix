{pkgs, ...}: {
  systemd.services.pm2 = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.pm2}/bin/pm2 resurrect";
      ExecStop = "${pkgs.pm2}/bin/pm2 kill";
    };
  };
}
