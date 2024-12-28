{ flavor, accent, ... }:
{
  catppuccin = {
    enable = false;
    inherit flavor accent;
    tty.enable = true;
  };
}
