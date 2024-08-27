{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          path = "$HOME/.config/hypr/hyprlock/background.png";
          blur_passes = 0;
          blur_size = 0;
        }
      ];

      label = [
        {
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "rgb(f397b0)";
          font_size = 90;
          font_family = "JetBrains Mono";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "rgb(f397b0)";
          font_size = 25;
          font_family = "JetBrains Mono";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      image = [
        {
          path = "$HOME/.config/hypr/hyprlock/avatar.png";
          position = "0, 75";
          halign = "center";
          valign = "center";
          border_color = "rgb(f397b0)";
        }
      ];

      input-field = [
        {
          size = "300, 60";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(f397b0)";
          inner_color = "rgb(fdf3f6)";
          font_color = "rgb(f08183)";
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##f08183"><i>Logging...</i></span>'';
          hide_input = false;
          check_color = "rgb(f2a0c9)";
          fail_color = "rgb(e95d5d)";
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          capslock_color = "rgb(ffe37d)";
          position = "0, -35";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
