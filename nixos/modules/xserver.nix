{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us,ru";
      variant = "lang";
      options = "grp:toggle";
    };

    desktopManager.xterm.enable = false;

    excludePackages = [ pkgs.xterm ];
  };
}
