{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:toggle, caps:escape";
    };

    desktopManager.xterm.enable = false;

    excludePackages = [ pkgs.xterm ];
  };
}
