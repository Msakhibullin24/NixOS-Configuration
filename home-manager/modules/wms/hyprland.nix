{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = ",1920x1280@60,auto,1";

      env = [
        "NIXOS_OZONE_WL,1"
        "GDK_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots/"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        numlock_by_default = true;

        kb_layout = "us,ru";
        kb_variant = ",";
        kb_options = "grp:toggle, caps:escape";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = -0.4;
      };

      general = {
        gaps_in = 5;
        # gaps_in = 0;
        gaps_out = 10;
        # gaps_out = 0;
        border_size = 3;
        # border_size = 1;
        "col.active_border" = "rgb(b4befe)";
        "col.inactive_border" = "rgb(1e1e2e)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        # rounding = 0;

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
        };

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
        };

        dim_inactive = true;
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
        disable_hyprland_logo = true;
        enable_anr_dialog = false;
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
        # "opacity 0.9, class:^(firefox)$"
        "float, title:^(MainPicker)$"
      ];

      layerrule = [
        "animation popin 60%, rofi"
      ];

      exec-once = [
        "waybar"
        "swww-daemon"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "toggle-touchpad"
        # "ciadpi --ip 127.0.0.1 --port 3128 -a15 -s1 -q1 -Y -At -a15 -T5 -b1000 -S -f-1 -r1+sm -As -a15"
        # "ciadpi --ip 127.0.0.1 --port 3128 -Kt,h -d1 -s0+s -d3+s -s6+s -d9+s -s12+s -d15+s -s20+s -d25+s -s30+s -d35+s -An -Ku -a19 -s443+s -d80+s -d443+s -s80+s -s443+s -d53+s -s53+s -d443+s"
      ];

      bind = [
        ''$mod, r, exec, random-wallpaper "$HOME/Pictures/wallpapers"''
        ''$mod shift, r, exec, random-wallpaper "$HOME/Pictures/nsfw"''

        ''ctrl alt, r, exec, swww img $HOME/Pictures/reset.png --transition-type=grow --transition-pos="top-right" --transition-bezier=".6,.1,.5,.9" --transition-duration="0.8" --transition-fps=60''

        ''$mod, kp_end, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 1''
        ''$mod, kp_down, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 2''
        ''$mod, kp_next, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 3''
        ''$mod, kp_left, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 4''
        ''$mod, kp_begin, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 5''
        ''$mod, kp_right, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 6''
        ''$mod, kp_home, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 7''
        ''$mod, kp_up, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 8''
        ''$mod, kp_prior, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 9''
        ''$mod, kp_insert, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 10''
        ''$mod, kp_delete, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 11''
        ''$mod, kp_enter, exec, favorite-wallpaper "$HOME/Pictures/wallpapers" 12''

        ''$mod shift, kp_end, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 1''
        ''$mod shift, kp_down, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 2''
        ''$mod shift, kp_next, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 3''
        ''$mod shift, kp_left, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 4''
        ''$mod shift, kp_begin, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 5''
        ''$mod shift, kp_right, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 6''
        ''$mod shift, kp_home, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 7''
        ''$mod shift, kp_up, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 8''
        ''$mod shift, kp_prior, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 9''
        ''$mod shift, kp_insert, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 10''
        ''$mod shift, kp_delete, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 11''
        ''$mod shift, kp_enter, exec, favorite-wallpaper "$HOME/Pictures/nsfw" 12''

        "$mod, return, exec, $TERMINAL"

        #''$mod shift, v, exec, vesktop --proxy-server="socks5://127.0.0.1:3128"''
        #''$mod shift, d, exec, discord --proxy-server=" socks5://127.0.0.1:3128 "''
        "$mod shift, w, exec, $BROWSER"
        "$mod shift, v, exec, vesktop"
        "$mod shift, d, exec, discord"
        "$mod shift, t, exec, ayugram-desktop"

        "$mod, d, exec, rofi -show drun"
        "$mod, x, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
        "$mod, v, exec, cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy"

        "$mod, c, killactive,"
        "$mod, tab, cyclenext,"
        "$mod shift, tab, cyclenext, prev"
        "$mod, tab, bringactivetotop,"
        "$mod shift, tab, bringactivetotop,"
        "$mod, apostrophe, exec, hyprlock"

        "$mod, t, togglefloating,"
        "$mod, f, fullscreen,"

        "$mod, s, togglesplit,"
        "$mod shift, s, togglespecialworkspace,"

        "$mod, p, exec, hyprpicker | wl-copy"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod shift, h, movewindow, l"
        "$mod shift, l, movewindow, r"
        "$mod shift, k, movewindow, u"
        "$mod shift, j, movewindow, d"

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
        "ctrl, xf86audiomicmute, exec, pamixer --default-source -i 5"
        "ctrl shift, xf86audiomicmute, exec, pamixer --default-source -d 5"

        ", xf86monbrightnessdown, exec, brightnessctl set 5%-"
        ", xf86monbrightnessup, exec, brightnessctl set 5%+"

        "$mod ctrl, xf86touchpadtoggle, exec, toggle-touchpad"

        ", print, exec, grim - | swappy -f -"
        ''$mod, print, exec, grim -g "$(slurp)" - | swappy -f -''

        "$mod, b, exec, pkill -sigusr1 waybar"
        "$mod, w, exec, pkill -sigusr2 waybar"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
