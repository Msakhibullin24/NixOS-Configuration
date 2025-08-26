{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop apps
    firefox-beta
    firefox-devedition
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
    android-tools
    gnumake
    cmake
    # Hyprland stuff
    xdg-desktop-portal-hyprland
    wl-clipboard
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
    virtiofsd
    playerctl
    cliphist
    grim
    grimblast
    brightnessctl
    # GUI utils
    mpv
    vlc
    feh
    rofi-power-menu
    hyprpicker
    wlroots
    slurp
    swappy
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
    # terraria-server
    osu-lazer-bin
    xonotic
    # Other
  ];
}
