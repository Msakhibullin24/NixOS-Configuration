{ pkgs, ... }:
let
  power-menu = pkgs.writeScriptBin "power-menu" (builtins.readFile ./powermenu.sh);
  toggle-touchpad = pkgs.writeScriptBin "toggle-touchpad" (builtins.readFile ./toggletouchpad.sh);
in {
  home.packages = [
    power-menu
    toggle-touchpad
  ];
}
