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
    blender
    obs-studio
    godot_4
    ani-cli
    anilibria-cli
    # Network stuff
    privoxy
    # CLI utils
    cava
    neofetch
    btop
    gdu
    ranger
    kalker
    cmatrix
    zip
    unzip
    rar
    p7zip
    swww
    mpvpaper
    socat
    # GUI utils
    mpv
    feh
    ueberzugpp
    rofi-wayland
    rofi-power-menu
    # Games
    gamemode
    gamescope
    mangohud
    steam
    (lutris.override {
      extraPkgs = pkgs: [
        wine
        kdialog
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
