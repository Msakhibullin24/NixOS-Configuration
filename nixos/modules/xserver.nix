{ pkgs, ... }: {
  services.xserver = {
    enable = true;

    xkb.layout = "us,ru";
    xkb.variant = "lang";
    xkb.options = "grp:toggle";

    desktopManager.xterm.enable = false;

    excludePackages = [ pkgs.xterm ];
  };
}
