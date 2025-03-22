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
    gparted
    blender
    libreoffice-fresh
    opentabletdriver
    # Network stuff
    socat
    privoxy
    zerotierone
    spoofdpi
    byedpi
    # Coding stuff
    gdb
    (python3.withPackages (ps: with ps; [ debugpy ]))
    clang
    dotnet-sdk_9
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
    ags-pkgs.io
    # GUI utils
    mpv
    vlc
    feh
    ueberzug
    rofi-power-menu
    hyprpicker
    # ags
    # Games
    gamemode
    gamescope
    mangohud
    steam
    (lutris.override {
      extraPkgs = pkgs: [
        wine
        kdePackages.kdialog
        jdk
      ];
    })
    mindustry-wayland
    terraria-server
    osu-lazer-bin
    xonotic
    # Other
  ];
}
