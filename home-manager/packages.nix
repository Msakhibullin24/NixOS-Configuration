{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop apps
    firefox
    firefox-devedition
    ayugram-desktop
    keepassxc
    qbittorrent
    krita
    obs-studio
    gparted
    libreoffice-fresh
    # Network stuff
    socat
    zerotierone
    # Coding stuff
    gdb
    (python3.withPackages (
      ps: with ps; [
        jupyterlab
      ]
    ))
    uv
    clang
    nodejs
    nodePackages.pnpm
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
