{ pkgs, ... }:
let
  toggle-touchpad = pkgs.writeScriptBin "toggle-touchpad" (builtins.readFile ./toggletouchpad.sh);
  favorite-wallpaper = pkgs.writeScriptBin "favorite-wallpaper" (
    builtins.readFile ./favoritewallpaper.sh
  );
  random-wallpaper = pkgs.writeScriptBin "random-wallpaper" (builtins.readFile ./randomwallpaper.sh);
  _check = pkgs.writeScriptBin "_check" (builtins.readFile ./_check.sh);
in
{
  home.packages = [
    toggle-touchpad
    favorite-wallpaper
    random-wallpaper
    _check
  ];
}
