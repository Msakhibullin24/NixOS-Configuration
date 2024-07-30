{
  services.xserver = {
    enable = true;

    xkb.layout = "us,ru";
    xkb.variant = "lang";
    xkb.options = "grp:toggle";
  };
}
