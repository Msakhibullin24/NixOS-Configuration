{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = ",1920x1080@90,auto,1";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots/"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        numlock_by_default = true;

        kb_layout = "us,ru";
        kb_variant = "lang";
        kb_options = "grp:toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;

        layout = "dwindle";
      };

      decoration = {
        rounding = 5;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;

        dim_inactive = false;
	dim_strength = 0.4;
      };

      animations = {
        enabled = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      dwindle = {
        preserve_split = true;
      };

      windowrule = [
      ];

      exec-once = [
        "swww init"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
	      "toggle-touchpad"
      ];

      bind = [
        "$mod, Return, exec, alacritty"

        "$mod SHIFT, E, exec, alacritty -e nvim"
        "$mod SHIFT, R, exec, alacritty -e ranger"
	      "$mod SHIFT, W, exec, firefox"
	      "$mod SHIFT, T, exec, telegram-desktop"
	      "$mod SHIFT, V, exec, vesktop"

        "$mod, D, exec, pkill wofi || wofi --show drun"
	      "$mod, X, exec, pkill wofi || power-menu"
        "$mod, V, exec, pkill wofi || cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        "$mod, L, exec, hyprlock"
        "$mod, C, killactive,"
        "$mod, Q, exit,"

        "$mod, Space, togglefloating,"
	      "$mod, F, fullscreen,"
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"

        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"

        "$mod SHIFT, left,  swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up,    swapwindow, u"
        "$mod SHIFT, down,  swapwindow, d"

        "$mod CTRL, left,  resizeactive, -60 0"
        "$mod CTRL, right, resizeactive,  60 0"
        "$mod CTRL, up,    resizeactive,  0 -60"
        "$mod CTRL, down,  resizeactive,  0  60"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"

	      "$mod CONTROL, XF86TouchpadToggle, exec, toggle-touchpad"

        '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        "$mod, B, exec, pkill -SIGUSR1 waybar"
        "$mod, W, exec, pkill -SIGUSR2 waybar"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
