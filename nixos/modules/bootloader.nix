{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    initrd.kernelModules = ["amdgpu"];
    kernelParams = ["psmouse.synaptics_intertouch=0"];
  };
}
