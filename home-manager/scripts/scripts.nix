{ pkgs, ... }:
let
  wallpaper-set = pkgs.writeScriptBin "wallpaper-set" (builtins.readFile ./wallpaper-set.sh);
  wallpaper-init = pkgs.writeScriptBin "wallpaper-init" (builtins.readFile ./wallpaper-init.sh);
  toggle-touchpad = pkgs.writeScriptBin "toggle-touchpad" (builtins.readFile ./toggletouchpad.sh);
in {
  home.packages = [
    wallpaper-set
    wallpaper-init
    toggle-touchpad
  ];
}
