{
  imports = [
    ./modules
    ./scripts
    ./bash.nix
    ./packages.nix
    ./zsh.nix
  ];

  home = {
    username = "darkangel";
    homeDirectory = "/home/darkangel";
    stateVersion = "24.05";
  };
}
