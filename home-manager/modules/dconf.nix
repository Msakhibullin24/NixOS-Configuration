{ flavor, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = if flavor == "latte" then "prefer-light" else "prefer-dark";
    };
  };
}
