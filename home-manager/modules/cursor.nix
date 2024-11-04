{ pkgs, ... }: {
  home. pointerCursor = {
    package = pkgs.stable.catppuccin-cursors.mochaRosewater;
    name = "catppuccin-mocha-rosewater-cursors";
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = true;
    };
  };
}
