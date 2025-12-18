{ pkgs, config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.preLVMCommands = ''
    export LVM_SUPPRESS_FD_WARNINGS=1
  '';
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [ "v4l2loopback" ];
  security.polkit.enable = true;
  boot.extraModprobeConfig = ''
  opt ions v4l2loopback devices=2 video_nr=1,2 card_label="OBS Cam, Virt Cam" exclusive_caps=1
'';
}
