{
  boot = {
    loader = {
      efi = {
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;

        efiSupport = true;
        efiInstallAsRemovable = true;
        extraEntries = ''
          menuentry "Reboot" --class restart {
            reboot
          }
          menuentry "Poweroff" --class shutdown {
            halt
          }
        '';
      };
    };

    initrd.kernelModules = [ ];
    kernelParams = [ "psmouse.synaptics_intertouch=0" ];
  };
}
