{ pkgs, ... }:
{  
  systemd.services.poweralertd = {
    description = "Battery monitoring daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.poweralertd}/bin/poweralertd --low-threshold 40 --critical-threshold 20 --low-command 'notify-send \"Battery Low\" \"Battery is below 40%\"' --critical-command 'notify-send \"Battery Critical\" \"Battery is below 20%\"'";
      Restart = "always";
      RestartSec = "600s";
    };
    install.wantedBy = [ "multi-user.target" ];
  };
}

