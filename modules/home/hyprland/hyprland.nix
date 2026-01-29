{ inputs, pkgs, stdenv, ...}:
{
  home.packages = with pkgs; [
    swww
    inputs.hypr-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
    hyprpicker
    inputs.hyprmag.packages.${pkgs.stdenv.hostPlatform.system}.hyprmag
    grim
    slurp
    wl-clipboard
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    scrcpy
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
