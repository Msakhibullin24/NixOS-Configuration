{
  programs.bash = {
    enable = true;
    shellAliases =
      let
        flakeDir = "$HOME/nix";
      in
      {
        upd = "nix flake update --flake path:${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake path:${flakeDir}";

        hms = "home-manager switch --flake path:${flakeDir}";
        hmconf = "nvim ${flakeDir}/home-manager/home.nix";
        hmpkgs = "nvim ${flakeDir}/home-manager/packages.nix";

        rb = "sudo nixos-rebuild switch --flake path:${flakeDir}";
        conf = "nvim ${flakeDir}/nixos/configuration.nix";
        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        ll = "ls -l";
        v = "nvim";
        de = "doas nvim";
        nf = "neofetch";
      };
  };
}
