{ pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = (with pkgs; [
    # Desktop apps
    # Coding stuff
      # C++
    clang
    gdb
    vscode-extensions.vadimcn.vscode-lldb
      # Python
    (python3.withPackages (ps: with ps; [
      debugpy
    ]))
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
    ripgrep
    # GUI utils
    # Xorg stuff
    # Wayland stuff
    wl-clipboard
    cliphist
    # WMs and stuff
    xdg-desktop-portal-hyprland
    seatd
    hyprland
    # Sound
    alsa-lib
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
    gnome.adwaita-icon-theme
    vimix-cursor-theme
    catppuccin-cursors.latteRed
    catppuccin-papirus-folders
  ])
  ++
  (with pkgs-unstable; [
    # Desktop apps
    # Coding stuff
    # CLI utils
    spoofdpi
    # GUI utils
    # Games
    # Other
  ]);

  fonts.packages = with pkgs; [
    jetbrains-mono
    iosevka
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
