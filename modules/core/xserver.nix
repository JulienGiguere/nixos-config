{ pkgs, username, ... }:
{
  services = {
    xserver = {
      enable = true;
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
}
