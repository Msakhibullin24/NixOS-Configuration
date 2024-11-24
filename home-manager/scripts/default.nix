{pkgs, ...}: let
  toggle-touchpad = pkgs.writeScriptBin "toggle-touchpad" (builtins.readFile ./toggletouchpad.sh);
in {
  home.packages = [
    toggle-touchpad
  ];
}
