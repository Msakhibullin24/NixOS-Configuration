{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop apps
    alacritty
    firefox-wayland
    discord
    vesktop
    ayugram-desktop
    keepassxc
    qbittorrent
    krita
    obs-studio
    godot_4
    ani-cli
    anilibria-cli
    rustdesk
    aseprite
    zoom-us
    gparted
    # Network stuff
    socat
    privoxy
    zerotierone
    spoofdpi
    byedpi
    # Coding stuff
    tgbot-cpp
    gdb
    (python3.withPackages (ps: with ps; [ debugpy ]))
    clang
    dotnet-sdk_9
    nodejs
    nodePackages.pnpm
    ngrok
    android-tools
    # CLI utils
    cava
    neofetch
    btop
    radeontop
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
    zsh-powerlevel10k
    ripgrep
    # GUI utils
    mpv
    vlc
    feh
    ueberzug
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
        jdk
      ];
    })
    mindustry-wayland
    terraria-server
    osu-lazer-bin
    # Other
  ];
}
