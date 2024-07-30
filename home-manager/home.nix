{
  imports = [
    ./zsh.nix
    ./bash.nix
    ./modules/bundle.nix
    ./packages.nix
  ];

  home = {
    username = "darkangel";
    homeDirectory = "/home/darkangel";
    stateVersion = "24.05";
  };
}
