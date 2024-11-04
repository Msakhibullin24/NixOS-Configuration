{
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    settings = {
      Theme = {
        CursorTheme = "catppuccin-mocha-rosewater-cursors";
      };
    };
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = ./backgrounds/oshino-shinobu.png;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
