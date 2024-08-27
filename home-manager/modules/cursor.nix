{ pkgs, ...}: {
  home = {
    pointerCursor = {
      package = pkgs.catppuccin-cursors.latteRed;
      name = "catppuccin-latte-red-cursors";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
