{pkgs, ...}: let
  settings = import ../../home/settings.nix;
in {
  systemd.services.pm2 = {
    description = "PM2 process manager";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "forking";
      User = settings.user.username;

      Environment = [
        "PM2_HOME=${settings.homeDir}/.pm2"
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
