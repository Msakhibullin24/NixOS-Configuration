{
  pkgs,
  flavor,
  accent,
  ...
}:
{
  gtk = {
    enable = true;

    theme =
      let
        size = "standard";
      in
      {
        package = pkgs.catppuccin-gtk.override {
          accents = [ accent ];
          variant = flavor;
          inherit size;
        };
        name = "catppuccin-${flavor}-${accent}-${size}";
      };
  };
}
