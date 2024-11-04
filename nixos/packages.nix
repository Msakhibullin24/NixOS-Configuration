{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # CLI utils
    bash
    zsh
    nix-index
    ntfs3g
    doas
    doas-sudo-shim
    killall
    openssh
    openssl
    wget
    git
    brightnessctl
    zapret
    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    # WMs and stuff
    xdg-desktop-portal-hyprland
    hyprland
    seatd
    waybar
    # Sound
    pipewire
    pulseaudio
    wireplumber
    alsa-lib
    alsa-utils
    pamixer
    bluez
    bluez5
    bluez-tools
    # GPU stuff
    amdvlk
    mesa
    # Screenshotting
    grim
    grimblast
    slurp
    swappy
    # Other
    home-manager
    adwaita-icon-theme
    vimix-cursor-theme
    stable.catppuccin-cursors.mochaRosewater
    stable.catppuccin-papirus-folders
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    iosevka
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
