{ pkgs, pkgs-unstable, ... }: {
  home.packages = (with pkgs; [
    # Desktop apps
    alacritty
    firefox
    telegram-desktop
    vesktop
    keepassxc
    qbittorrent
    krita
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
    terraria-server
    # Other
  ])
  ++
  (with pkgs-unstable; [
    # Desktop apps
    aseprite
    # Coding stuff
    # CLI utils
    # GUI utils
    # Games
    osu-lazer-bin
    # Other
  ]);
}
