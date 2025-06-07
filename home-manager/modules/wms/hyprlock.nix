{
  catppuccin.hyprlock.useDefaultConfig = false;
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          path = "$HOME/Pictures/hyprlock.png";
          blur_passes = 0;
          blur_size = 0;
        }
      ];

      label = [
        {
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "$subtext0";
          font_size = 90;
          font_family = "JetBrainsMono NF";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "$subtext0";
          font_size = 25;
          font_family = "JetBrainsMono NF";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      input-field = [
        {
          size = "400, 60";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "$subtext1";
          inner_color = "$crust";
          font_color = "$text";
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##$textAlpha"><i>Logging...</i></span>'';
          hide_input = false;
          check_color = "$surface0";
          fail_color = "$red";
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          capslock_color = "$yellow";
          position = "0, -485";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
