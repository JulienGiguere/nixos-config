{ pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      # source = $HOME/.config/hypr/wallust/wallust-hyprland.conf
      # $Scripts = $HOME/.config/hypr/scripts

      general =  {
        grace = 1;
        fractional_scaling = 2;
        immediate_render = true;
      };

      background = {
        path = "/home/julien/Pictures/wallpapers/wallpaper.jpg" ;

        color = "rgb(0,0,0)";

        blur_size = 3;
        blur_passes = 2;
        noise = 0.0117;
        contrast = 1.3000;
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };


      # # Date
      #     label = {
      #       text = "cmd[update:18000000] echo '<b>' '$(date +'%A, %-d %B')' '</b>';
      #       color = #F68D3E;
      #       font_size = 16;
      #       font_family = Victor Mono Bold Italic;
      #       position = 0, -120;
      #       halign = center;
      #       valign = center;
      #   };

      # Hour-Time
      # label = {
      #     text = cmd[update:1000] echo "$(date +"%H")"
      # #    text = cmd[update:1000] echo "$(date +"%I")" #AM/PM
      # 	#color = rgba(255, 185, 0, .8)
      #     color = #F68D3E
      #     font_size = 200
      #     font_family = JetBrainsMono Nerd Font ExtraBold
      #     position = 0, -60
      #     halign = center
      #     valign = top
      # }

      # # Minute-Time
      # label {
      #     monitor =
      #     text = cmd[update:1000] echo "$(date +"%M")"
      #     #color = rgba(15, 10, 222, .8)
      #     color = $color12
      #     font_size = 200
      #     font_family = JetBrainsMono Nerd Font ExtraBold
      #     position = 0, -340
      #     halign = center
      #     valign = top
      # }

      # # Seconds-Time
      # label {
      #     monitor =
      #     text = cmd[update:1000] echo "$(date +"%S")"
      # #    text = cmd[update:1000] echo "$(date +"%S %p")" #AM/PM
      #     color = $color11
      #     font_size = 35
      #     font_family = JetBrainsMono Nerd Font ExtraBold
      #     position = 0, -350
      #     halign = center
      #     valign = top
      # }

      # Put a picture of choice here. Default is the current wallpaper
      #image {
      #    monitor =
      #    path = $HOME/.config/hypr/wallpaper_effects/.wallpaper_current
      #    size = 160
      #    rounding = -1
      #    border_size = 0
      #    border_color = $color11
      #    rotate = 0
      #    reload_time = -1
      #    position = 0, 280
      #    halign = center
      #    valign = bottom
      #}

      # USER
      label = [
        {
          text = "  $USER";
          color = "#F68D3E";
          font_size = "24";
          font_family = "Victor Mono Bold Oblique";
          position = "0, 220";
          halign = "center";
          valign = "bottom";
        }
        # battery information
        {
          text = "cmd[update:1000] echo '<b> '$($Scripts/Battery.sh)' </b>'";
          color = "#F68D3E";
          font_size = 16;
          font_family = "Victor Mono Bold Oblique";
          position = "0, 30";
          halign = "right";
          valign = "bottom";
        }
        # uptime
        {
          text = "cmd[update:60000] echo '<b> '$(uptime -p || $Scripts/UptimeNixOS.sh)' </b>'";
          color = "#F68D3E";
          font_size = 16;
          font_family = "Victor Mono Bold Oblique";
          position = "0, 0";
          halign = "right";
          valign = "bottom";
        }
        # Date
        {
          text = "cmd[update:18000000] echo '<b>' '$(date +'%A, %-d %B')' '</b>'";
          color = "#F68D3E";
          font_size = 16;
          font_family = "Victor Mono Bold Italic";
          position = "0, -120";
          halign = "center";
          valign = "center";
        }
    ];


      # # Keyboard LAYOUT
      # label {
      #     monitor =
      #     text = $LAYOUT
      #     color = #F68D3E
      #     font_size = 10
      #     font_family = Victor Mono Bold Oblique
      #     position = 0, 70
      #     halign = center
      #     valign = bottom
      # }

      # # weather edit the scripts for locations
      # # weather scripts are located in ~/.config/hypr/UserScripts Weather.sh and/or Weather.py
      # # see https://github.com/JaKooLit/Hyprland-Dots/wiki/TIPS#%EF%B8%8F-weather-app-related-for-waybar-and-hyprlock
      # label {
      #     monitor =
      #     text = cmd[update:3600000] [ -f "$HOME/.cache/.weather_cache" ] && cat "$HOME/.cache/.weather_cache"
      #     color = #F68D3E
      #     font_size = 16
      #     font_family = Victor Mono Bold Oblique
      #     position = 50, 0
      #     halign = left
      #     valign = bottom
      # }

      # INPUT FIELD
      input-field = {
        size = "200, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "$color11";
        inner_color = "rgba(255, 255, 255, 0.1)";
        capslock_color = "rgb(255,255,255)";
        font_color = "#F68D3E";
        fade_on_empty = false;
        font_family = "Victor Mono Bold Oblique";
        placeholder_text = "<i><span foreground='##ffffff99'>🔒 Type Password</span></i>";
        hide_input = false;
        position = "0, 100";
        halign = "center";
        valign = "bottom";
      };
    };
  };
}
