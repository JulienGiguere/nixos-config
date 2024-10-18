{ config, pkgs, ... }:
{
  systemd.services.poweralertd = {
    description = "Battery monitoring daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.poweralertd}/bin/poweralertd --low-threshold 20 --critical-threshold 10 --low-command 'notify-send \"Battery Low\" \"Battery is below 20%\"' --critical-command 'notify-send \"Battery Critical\" \"Battery is below 10%\"'";
      Restart = "always";
      RestartSec = "30s";
    };
    install.wantedBy = [ "multi-user.target" ];
  };

  environment.systemPackages = with pkgs; [
    poweralertd
  ];
}
