{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Desktop apps
    alacritty
    # Coding stuff
    clang
    gdb
    lldb
    vscode-extensions.vadimcn.vscode-lldb
    llvm
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
    swww
    zip
    unzip
    rar
    unrar
    ripgrep
    # GUI utils
    feh
    # Xorg stuff
    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    # WMs and stuff
    xdg-desktop-portal-hyprland
    hyprland
    hyprlock
    waybar
    wofi
    gtk3
    # Sound
    pipewire
    alsa-lib
    pamixer
    # GPU stuff 
    amdvlk
    mesa
    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy
    # Other
    home-manager
    vimix-cursor-theme
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
