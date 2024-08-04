{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "5 9 0 9";

        modules-left = [ "clock" "hyprland/language" "custom/touchpad" "keyboard-state" "group/group-power" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "network" "pulseaudio" "backlight" "battery" "tray" ];

        "clock" = {
          format = "{:%H:%M} 󰥔";
          format-alt = "{:%d.%m.%Y} 󰥔";
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
          format = "{icon} ";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "group/group-power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 100;
            children-class = "not-power";
            transition-left-to-right = true;
          };
          modules = [
            "custom/power"
            "custom/reboot"
            "custom/suspend"
            "custom/lock"
            "custom/quit"
          ];
        };

        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = "poweroff";
        };

        "custom/reboot" = {
          format = "󰜉";
          tooltip = false;
          on-click = "reboot";
        };

        "custom/suspend" = {
          format = "󰤄";
          tooltip = false;
          on-click = "systemctl suspend";
        };

        "custom/lock" = {
          format = "󰌾";
          tooltip = false;
          on-click = "hyprlock";
        };

        "custom/quit" = {
          format = "󰈆";
          tooltip = false;
          on-click = "hyprctl dispatch exit";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "󰄯";
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 6 7 8 9 10 ];
          };
        };

        "network" = {
          interface = "wlp1s0";
          format = "{ifname}";
          format-alt = "{ipaddr}";
          format-wifi = "{essid} ({signalStrength}%) 󰖩";
          format-ethernet = "󰈁";
          format-disconnected = "";
          tooltip = false;
          max-length = 50;
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon}󰂯 {format_source}";
          format-bluetooth-muted = "󰝟 {icon}󰂯 {format_source}";
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
              default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pamixer -t";
          on-click-right = "pamixer --default-source -t";
          min-length = 13;
        };

        "backlight" = {
          device = "amdgpu_bl1";
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" "" ];
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
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        "tray" = {
          icon-size = 20;
          spacing = 0;
        };
      };
    };
  
    style = 
      ''
* {
  border: none;
  border-radius: 0;
  font-family: JetBrains Mono;
  font-weight: bold; 
  min-height: 20px;
}

window#waybar {
  background: transparent;
}

window#waybar.hidden {
  opacity: 0.2;
}

#clock {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 14px;
  transition: none;
  color: @lavender;
  background: @base;
}

#language {
  padding-left: 16px;
  padding-right: 8px;
  border-radius: 14px 0px 0px 14px;
  transition: none;
  color: @flamingo;
  background: @base;
}

#custom-touchpad {
  padding-left: 0px;
  padding-right: 16px;
  transition: none;
  color: @pink;
  background: @base;
}

#keyboard-state {
  margin-right: 8px;
  padding-right: 16px;
  border-radius: 0px 14px 14px 0px;
  transition: none;
  color: @mauve;
  background: @base;
}

#group-power {
  padding: 0 0;
  border-radius: 14px;
  color: red;
  background: @base;
}

#custom-power,
#custom-reboot,
#custom-suspend,
#custom-lock,
#custom-quit {
  padding-left: 12px;
  padding-right: 12px;
}

#custom-power:hover,
#custom-reboot:hover,
#custom-suspend:hover,
#custom-lock:hover,
#custom-quit:hover {
  transition: none;
  box-shadow: inherit;
  text-shadow: inherit;
  border-radius: 13px;
  color: @base;
  background: @red;
}

#workspaces {
  border-radius: 14px;
  transition: none;
  background: @base;
}

#workspaces button {
  transition: none;
  color: @lavender;
  background: transparent;
  padding: 8px;
  font-size: 14px;
}

#workspaces button.persistent {
  color: @lavender;
  font-size: 14px;
}

#workspaces button:hover {
  transition: none;
  box-shadow: inherit;
  text-shadow: inherit;
  border-radius: inherit;
  color: @base;
  background: @lavender;
}

#workspaces button.active {
  background: @crust;
  color: @maroon;
  border-radius: inherit;
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
  transition: none;
  color: @red;
  background: @base;
}

#pulseaudio.muted {
  background-color: @flamingo;
  color: @base;
}

#backlight {
  margin-left: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 14px;
  transition: none;
  color: @yellow;
  background: @base;
}

#battery {
  margin-left: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 14px;
  transition: none;
  color: @green;
  background: @base;
}

#battery.charging {
  color: @base;
  background-color: @teal;
}

#battery.warning:not(.charging) {
  background-color: @peach;
  color: @base;
}

#battery.critical:not(.charging) {
  background-color: maroon;
  color: @base;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#tray {
  margin-left: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 14px;
  transition: none;
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
