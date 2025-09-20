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
          device = "inel_backlight";
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

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono NF";
        font-size: 14px;
        font-weight: bold;
        min-height: 20px;
        transition: none;
      }

      window#waybar {
        background: transparent;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces {
        margin-right: 8px;
        border-radius: 14px;
        background: @base;
      }

      #workspaces button {
        padding: 6px 8px;
        animation: ws_normal 2s ease-in-out 1;
        color: @lavender;
        background: transparent;
      }

      #workspaces button.persistent {
        color: @lavender;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        animation: ws_hover 2s ease-in-out 1;
        transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
        color: @base;
        background: @lavender;
      }

      #workspaces button.active {
        padding: 6px 14px;
        border-radius: inherit;
        animation: ws_active 2s ease-in-out 1;
        transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
        color: @maroon;
        background: @crust;
      }

      #language {
        padding-left: 16px;
        padding-right: 8px;
        border-radius: 14px 0 0 14px;
        color: @flamingo;
        background: @base;
      }

      #custom-touchpad {
        padding-left: 0;
        padding-right: 16px;
        color: @pink;
        background: @base;
      }

      #keyboard-state {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0 14px 14px 0;
        color: @mauve;
        background: @base;
      }

      #clock {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @lavender;
        background: @base;
      }

      #custom-_check {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @red;
        background: @base;
      }

      #window {
        margin-right: 8px;
        padding-right: 16px;
        padding-left: 16px;
        border-radius: 14px;
        color: @rosewater;
        background: @base;
      }

      #mpris {
        margin-right: 8px;
        padding-right: 16px;
        padding-left: 16px;
        border-radius: 14px;
        color: @rosewater;
        background: @base;
      }

      #mpris.paused {
        color: @base;
        background: @rosewater;
      }

      window#waybar.empty #window {
        background: transparent;
      }

      #network {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @rosewater;
        background: @base;
      }

      #pulseaudio {
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @red;
        background: @base;
      }

      #pulseaudio.muted {
        color: @base;
        background-color: @flamingo;
      }

      #backlight {
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @yellow;
        background: @base;
      }

      #battery {
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @green;
        background: @base;
      }

      #battery.charging {
        color: @base;
        background-color: @teal;
      }

      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        color: @base;
        background-color: @maroon;
      }

      #tray {
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 14px;
        color: @text;
        background: @base;
      }

      @keyframes blink {
        to {
          background-color: @base;
          color: @green;
        }
      }
    '';
  };
}
