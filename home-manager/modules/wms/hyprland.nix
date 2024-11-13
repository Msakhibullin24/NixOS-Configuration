{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = [pkgs.hyprlandPlugins.hyprscroller];

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

        touchpad = {natural_scroll = false;};

        sensitivity = -0.4;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        # "col.active_border" = "rgba()";
        # "col.inactive_border" = "rgba()";

        layout = "scroller";
      };

      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;

        dim_inactive = false;
        dim_strength = 7.0e-2;
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

      master = {new_status = true;};

      windowrulev2 = ["float, class:^(feh)$" "float, title:^(MainPicker)$"];

      exec-once = [
        "waybar"
        "wallpaper-init"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "toggle-touchpad"
        "ciadpi --ip 127.0.0.1 --port 3128 -a15 -s1 -q1 -Y -At -a15 -T5 -b1000 -S -f-1 -r1+sm -As -a15"
      ];

      bind = [
        # "$mod, return, exec, alacritty"
        "$mod, return, exec, foot"

        "$mod shift, w, exec, firefox"
        ''$mod shift, v, exec, vesktop --proxy-server="socks5://127.0.0.1:3128"''
        ''$mod shift, d, exec, discord --proxy-server=" socks5://127.0.0.1:3128 "''
        "$mod shift, t, exec, ayugram-desktop"

        "$mod, d, exec, rofi -show drun"
        "$mod, x, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
        # "$mod, x, exec, wlogout"
        "$mod, v, exec, cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy"

        "$mod, c, killactive,"
        "$mod, tab, cyclenext,"
        "$mod, tab, bringactivetotop,"
        "$mod, apostrophe, exec, hyprlock"

        "$mod, t, togglefloating,"
        "$mod, f, fullscreen,"

        "$mod, s, scroller:cyclesize, next"
        "$mod shift, s, scroller:cyclesize, prev"

        "$mod, i, scroller:admitwindow,"
        "$mod, o, scroller:expelwindow,"

        "$mod shift, i, scroller:setmode, col"
        "$mod shift, o, scroller:setmode, row"

        "ctrl alt, h, scroller:alignwindow, l"
        "ctrl alt, j, scroller:alignwindow, d"
        "ctrl alt, k, scroller:alignwindow, u"
        "ctrl alt, l, scroller:alignwindow, r"
        "ctrl alt, c, scroller:alignwindow, c"

        "ctrl alt, a, scroller:fitsize, active"
        "ctrl alt, v, scroller:fitsize, visible"
        "ctrl alt shift, a, scroller:fitsize, all"
        "ctrl alt, e, scroller:fitsize, toend"
        "ctrl alt, b, scroller:fitsize, tobeg"

        "$mod, a, scroller:toggleoverview,"

        "$mod, h, scroller:movefocus, l"
        "$mod, l, scroller:movefocus, r"
        "$mod, k, scroller:movefocus, u"
        "$mod, j, scroller:movefocus, d"

        "$mod shift, h, scroller:movewindow, l"
        "$mod shift, l, scroller:movewindow, r"
        "$mod shift, k, scroller:movewindow, u"
        "$mod shift, j, scroller:movewindow, d"

        "$mod ctrl, h, resizeactive, -60 0"
        "$mod ctrl, l, resizeactive,  60 0"
        "$mod ctrl, k, resizeactive,  0 -60"
        "$mod ctrl, j, resizeactive,  0  60"

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

        "$mod shift, 1, movetoworkspace, 1"
        "$mod shift, 2, movetoworkspace, 2"
        "$mod shift, 3, movetoworkspace, 3"
        "$mod shift, 4, movetoworkspace, 4"
        "$mod shift, 5, movetoworkspace, 5"
        "$mod shift, 6, movetoworkspace, 6"
        "$mod shift, 7, movetoworkspace, 7"
        "$mod shift, 8, movetoworkspace, 8"
        "$mod shift, 9, movetoworkspace, 9"
        "$mod shift, 0, movetoworkspace, 10"

        "ctrl alt, 1, movetoworkspacesilent, 1"
        "ctrl alt, 2, movetoworkspacesilent, 2"
        "ctrl alt, 3, movetoworkspacesilent, 3"
        "ctrl alt, 4, movetoworkspacesilent, 4"
        "ctrl alt, 5, movetoworkspacesilent, 5"
        "ctrl alt, 6, movetoworkspacesilent, 6"
        "ctrl alt, 7, movetoworkspacesilent, 7"
        "ctrl alt, 8, movetoworkspacesilent, 8"
        "ctrl alt, 9, movetoworkspacesilent, 9"
        "ctrl alt, 0, movetoworkspacesilent, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        ", xf86audioraisevolume, exec, pamixer -i 5 "
        ", xf86audiolowervolume, exec, pamixer -d 5 "
        ", xf86audiomute, exec, pamixer -t"
        ", xf86audiomicmute, exec, pamixer --default-source -t"

        ", xf86monbrightnessdown, exec, brightnessctl set 5%-"
        ", xf86monbrightnessup, exec, brightnessctl set 5%+"

        "$mod ctrl, xf86touchpadtoggle, exec, toggle-touchpad"

        ", print, exec, grim - | swappy -f -"
        ''$mod, print, exec, grim -g "$(slurp)" - | swappy -f -''

        "$mod, b, exec, pkill -sigusr1 waybar"
        "$mod, w, exec, pkill -sigusr2 waybar"
      ];

      bindm = ["$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow"];
    };
  };
}
