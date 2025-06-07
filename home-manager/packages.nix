{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop apps
    firefox-wayland
    discord
    vesktop
    ayugram-desktop
    keepassxc
    qbittorrent
    krita
    obs-studio
    stable.godot_4
    ani-cli
    anilibria-cli
    aseprite
    gparted
    blender
    libreoffice-fresh
    # Network stuff
    socat
    zerotierone
    byedpi
    # Coding stuff
    gdb
    (python3.withPackages (ps: with ps; [ debugpy ]))
    clang
    nodejs
    nodePackages.pnpm
    ngrok
    android-tools
    gnumake
    cmake
    # CLI utils
    cava
    neofetch
    libsixel
    imagemagick
    radeontop
    gdu
    stable.kalker
    cmatrix
    zip
    unzip
    rar
    p7zip
    swww
    mpvpaper
    zsh-powerlevel10k
    ripgrep
    jq
    ags-pkgs.io
    virtiofsd
    # GUI utils
    mpv
    vlc
    feh
    ueberzug
    rofi-power-menu
    hyprpicker
    # Games
    gamemode
    gamescope
    mangohud
    steam
    (lutris.override {
      extraPkgs = pkgs: [
        jdk
        wine
        winetricks
        kdePackages.kdialog
        libadwaita
        gtk4
      ];
    })
    mindustry-wayland
    terraria-server
    osu-lazer-bin
    xonotic
    # Other
  ];
}
