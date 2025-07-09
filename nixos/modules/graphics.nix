{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
      libva-vdpau-driver
      libvdpau-va-gl
    ];
    enable32Bit = true;
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
}
