{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
    ];
    driSupport32Bit = true;
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
}
