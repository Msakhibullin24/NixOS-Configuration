{ pkgs, pkgs-unstable, ... }: {
  home.packages = (with pkgs; [
    # Desktop apps
    alacritty
    firefox-wayland
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
    rustdesk
    # Network stuff
    privoxy
    # Coding stuff
    nodejs
    # CLI utils
    cava
    neofetch
    btop
    gdu
    yazi
    kalker
    cmatrix
    zip
    unzip
    rar
    p7zip
    swww
    mpvpaper
    socat
    zerotierone
    zsh-powerlevel10k
    # GUI utils
    mpv
    feh
    ueberzug
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
    # Pentesting
    openvpn
    rustscan
    nmap
    ngrok
    android-tools
    thc-hydra
    wordlists
    crunch
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
    # Pentesting
    # Other
  ]);
}
