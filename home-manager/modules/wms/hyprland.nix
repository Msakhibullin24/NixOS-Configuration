{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = with pkgs.hyprlandPlugins; [
      hy3
    ];

    settings = {
      "$mod" = "SUPER";

      monitor = ",1920x1080@60,auto,1";

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

        sensitivity = -0.4;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;

        layout = "dwindle";
      };

      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;

        dim_inactive = false;
        dim_strength = 0.07;
      };

      animations = {
        enabled = true;

        bezier = [
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
        ];

        animation = [
          "windows, 1, 3, overshot, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2, default"
          "workspaces, 1, 4.5, md3_decel, slidefade 15%"
          # "workspaces, 1, 3.5, overshot, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
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
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = true;
      };

      windowrulev2 = [
        "float, class:^(feh)$"
      ];

      exec-once = [
        "waybar"
        "wallpaper-init"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
	      "toggle-touchpad"
        "spoofdpi"
      ];

      bind = [
        # "$mod, Return, exec, alacritty"
        "$mod, Return, exec, foot"

	      "$mod SHIFT, W, exec, firefox"
	      "$mod SHIFT, V, exec, vesktop"
	      "$mod SHIFT, T, exec, telegram-desktop"

        "$mod, D, exec, rofi -show drun"
	      "$mod, X, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
        "$mod, V, exec, cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy"

        "CTRL ALT, L, exec, hyprlock"
        "$mod, C, killactive,"
        "$mod, Q, exit,"

        "$mod, T, togglefloating,"
	      "$mod, F, fullscreen,"
        "$mod, P, pseudo, # dwindle"
        "$mod, S, togglesplit, # dwindle"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"

        "$mod CTRL, H, resizeactive, -60 0"
        "$mod CTRL, L, resizeactive,  60 0"
        "$mod CTRL, K, resizeactive,  0 -60"
        "$mod CTRL, J, resizeactive,  0  60"

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

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"

	      "$mod CTRL, XF86TouchpadToggle, exec, toggle-touchpad"

        '', Print, exec, grim - | swappy -f -''
        ''$mod, Print, exec, grim -g "$(slurp)" - | swappy -f -''

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
