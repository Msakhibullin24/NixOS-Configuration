{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop apps
    firefox
    firefox-devedition
    discord
    vesktop
    ayugram-desktop
    keepassxc
    qbittorrent
    krita
    obs-studio
    godot_4
    aseprite
    gparted
    blender
    libreoffice-fresh
    # Network stuff
    socat
    zerotierone
    # Coding stuff
    gdb
    (python3Full.withPackages (
      ps: with ps; [
        debugpy
      ]
    ))
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

    ollama
  ];
}
