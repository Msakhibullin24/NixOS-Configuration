{ flavor, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-rc no-cursor no-sudo";
    settings = {
      font_family = "JetBrainsMono NF";
      font_size = 11.0;

      enable_audio_bell = false;

      cursor_trail = 1;
      cursor_shape = "block";

      background_opacity = 0.9;
      background_tint = if flavor == "latte" then 0.5 else 0.8;
      background_image = "$HOME/Pictures/kitty.png";
      background_image_layout = "cscaled";
      background_image_linear = true;
    };
    keybindings = {
      "kitty_mod+j" = "previous_tab";
      "kitty_mod+k" = "next_tab";
    };
  };
}
