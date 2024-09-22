{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.darkangel = {
      isNormalUser = true;
      description = "DarkAngel";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      # packages = with pkgs; [];
    };
  };
}
