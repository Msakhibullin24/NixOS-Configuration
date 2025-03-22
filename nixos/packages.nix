{
  pkgs,
  flavor,
  accent,
  cursor-flavor,
  cursor-accent,
  ...
}:
{
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
    # hyprland-qtutils
    seatd
    waybar
    # Sound
    pipewire
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
    (catppuccin-cursors.override {
      flavor = cursor-flavor;
      accent = cursor-accent;
    })
    (catppuccin-papirus-folders.override {
      inherit flavor accent;
    })
  ];

  fonts.packages = with pkgs; [
    iosevka
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
  ];
}
