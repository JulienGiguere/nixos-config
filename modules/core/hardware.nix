{ pkgs, ... }:
{
#  hardware = {
#    graphics = {
#      enable = true;
#    };
#  };
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
