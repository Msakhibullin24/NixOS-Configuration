{pkgs, ...}: {
  home.packages = with pkgs; [
    # Desktop apps
    alacritty
    firefox-wayland
    vesktop
    ayugram-desktop
    keepassxc
    qbittorrent
    krita
    blender
    obs-studio
    godot_4
    ani-cli
    anilibria-cli
    rustdesk
    aseprite
    zoom-us
    # Network stuff
    socat
    privoxy
    zerotierone
    spoofdpi
    byedpi
    # Coding stuff
    tgbot-cpp
    gdb
    vscode-extensions.vadimcn.vscode-lldb
    (python3.withPackages (ps: with ps; [debugpy]))
    clang
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
    rofi-wayland
    rofi-power-menu
    wlogout
    # Games
    gamemode
    gamescope
    mangohud
    steam
    (lutris.override {extraPkgs = pkgs: [wine kdialog];})
    terraria-server
    osu-lazer-bin
    # Other
  ];
}
