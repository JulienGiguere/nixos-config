{ pkgs, ... }:
let 
  text = "rgb(251, 241, 199)";
in
{
  home.packages = [ pkgs.hypridle ];
  xdg.configFile."hypr/hypridle.conf".text = ''
general {
    lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
    before_sleep_cmd = loginctl lock-session    # lock before suspend.
    after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
}

listener {
    timeout = 900                                # 15min
    on-timeout = brightnessctl -s set 10         # set monitor backlight to minimum, avoid 0 on OLED monitor.
    on-resume = brightnessctl -r                 # monitor backlight restore.
}

listener {
    timeout = 960                                 # 16min
    on-timeout = loginctl lock-session            # lock screen when timeout has passed
}

listener {
    timeout = 1800                                # 30min
    on-timeout = hyprctl dispatch dpms off        # screen off when timeout has passed
    on-resume = hyprctl dispatch dpms on          # screen on when activity is detected after timeout has fired.
}

listener {
    timeout = 1800                                # 30min
    on-timeout = systemctl suspend                # suspend pc
}
  '';
}
