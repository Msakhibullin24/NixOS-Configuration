{ pkgs, ...}: {
  home = {
    pointerCursor = {
      package = pkgs.vimix-cursor-theme;
      name = "Vimix-Cursors-White";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
