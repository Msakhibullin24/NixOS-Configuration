{
  pkgs,
  cursor-flavor,
  cursor-accent,
  ...
}:
{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.override {
      flavor = cursor-flavor;
      accent = cursor-accent;
    };
    name = "catppuccin-${cursor-flavor}-${cursor-accent}-cursors";
    size = 24;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    gtk.enable = true;
    x11.enable = true;
  };
}
