{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Custom scripts
    (writeShellScriptBin "toggletouchpad" (builtins.readFile ./scripts/toggletouchpad))
    (writeShellScriptBin "powermenu" (builtins.readFile ./scripts/powermenu))
    # Desktop apps
    alacritty
    firefox
    telegram-desktop
    vesktop
    keepassxc
    qbittorrent
    krita
    unstable.aseprite
    # Coding stuff
    # CLI utils
    cava
    neofetch
    btop
    gdu
    ranger
    kalker
    # GUI utils
    ueberzugpp
    # Games
    gamemode
    gamescope
    mangohud
    steam
    (lutris.override {
      extraPkgs = pkgs: [
        wine
        gnome3.adwaita-icon-theme
      ];
    })
    unstable.osu-lazer-bin
    # Other
  ];
}
