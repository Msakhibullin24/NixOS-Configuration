{ pkgs, ... }:
{
  services.playerctld.enable = true;
  programs.waybar = {
    enable = true;
    package = pkgs.stable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # start_hidden = true;
        margin = "5 9 0 9";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/language"
          "custom/touchpad"
          "keyboard-state"
          "clock" # "group/group-power"
          "custom/_check"
        ];
        modules-center = [
          "mpris"
        ];
        modules-right = [
          "network"
          "pulseaudio"
          "backlight"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{icon}";
          # persistent-workspaces = {
          #   "*" = [ 1 2 3 4 5 6 7 8 9 10 ];
          # };
        };

        "hyprland/language" = {
          format-en = "US";
          format-ru = "RU";
          min-length = 5;
          tooltip = false;
        };

        "custom/touchpad" = {
          exec = "cat $XDG_RUNTIME_DIR/touchpad.status";
          interval = 2;
          min-length = 5;
          tooltip = false;
        };

        "keyboard-state" = {
          #numlock = true;
          capslock = true;
          format = "{icon}";
          format-icons = {
            locked = " ";
            unlocked = " ";
          };
        };

        "clock" = {
          format = "{:%H:%M} 󰥔";
          format-alt = "{:%d.%m.%Y} 󰥔";
          tooltip = false;
        };

        "custom/_check" = {
          exec = "_check";
          interval = 1;
          min-length = 5;
          tooltip = false;
        };

        "hyprland/window" = {
          format = "{title}";
          max-length = 50;
        };

        "mpris" = {
          format = "{status_icon} {player}: {dynamic}";
          title-len = 30;
          artist-len = 30;
          album-len = 30;
          dynamic-order = [
            "title"
            "artist"
            "album"
          ];
          # dynamic-len = 100;
          status-icons = {
            playing = "";
            paused = "";
            stopped = "";
          };
        };

        "network" = {
          interface = "wlp1s0";
          format = "{ifname}";
          format-alt = "{ipaddr}";
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "󰈁";
          format-disconnected = "";
          tooltip = false;
          max-length = 50;
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} 󰂯 {format_source}";
          format-bluetooth-muted = "󰝟 󰂯 {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% 󰍬";
          format-source-muted = "󰍭";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋋";
            headset = "󰋋";
            phone = "󰏲";
            portable = "󰏲";
            car = "󰄋";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pamixer -t";
          on-click-right = "pamixer --default-source -t";
          min-length = 13;
        };

        "backlight" = {
          device = "amdgpu_bl1";
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          min-length = 7;
          tooltip = false;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "tray" = {
          icon-size = 20;
          spacing = 0;
        };
      };
    };

    style = builtins.readFile ./waybar.css;
  };
}
