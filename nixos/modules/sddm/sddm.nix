{ lib, ... }: {
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    settings = {
      Theme = {
        CursorTheme = "Vimix-Cursors-White";
      };
    };
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = lib.cleanSource ./backgrounds/oshino-shinobu.png;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
