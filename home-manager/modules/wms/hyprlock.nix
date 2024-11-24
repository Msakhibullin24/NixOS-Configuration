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
          color = "rgb(a6adc8)";
          font_size = 90;
          font_family = "JetBrainsMono NF";
          position = "30, 0";
          halign = "left";
          valign = "top";
        }
        {
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "rgb(a6adc8)";
          font_size = 25;
          font_family = "JetBrainsMono NF";
          position = "30, -150";
          halign = "left";
          valign = "top";
        }
      ];

      # image = [
      #   {
      #     path = "$HOME/.config/hypr/hyprlock/avatar.png";
      #     position = "0, 75";
      #     halign = "center";
      #     valign = "center";
      #     border_color = "rgb(1a1918)";
      #   }
      # ];

      input-field = [
        {
          size = "400, 60";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(bac2de)";
          inner_color = "rgb(11111b)";
          font_color = "rgb(cdd6f4)";
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##cdd6f4"><i>Logging...</i></span>'';
          hide_input = false;
          check_color = "rgb(313244)";
          fail_color = "rgb(f38ba8)";
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          capslock_color = "rgb(f9e2af)";
          position = "0, -485";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
