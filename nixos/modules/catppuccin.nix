{ flavor, accent, ... }:
{
  catppuccin = {
    enable = true;
    inherit flavor accent;
    sddm.enable = false;
  };
}
