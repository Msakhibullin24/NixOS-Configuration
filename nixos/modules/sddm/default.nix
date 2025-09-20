{ config, pkgs, lib, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    settings = {
      Theme = {
        CursorTheme = "Viczka";
        CursorSize = 24;
      };
    };
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = ./backgrounds/oshino-shinobu.png;
        ScreenWidth = 1920;
        ScreenHeight = 1280;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
