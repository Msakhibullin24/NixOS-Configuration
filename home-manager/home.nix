{username, ...}: {
  imports = [
    ./modules
    ./scripts
    ./bash.nix
    ./packages.nix
    ./zsh.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
}
