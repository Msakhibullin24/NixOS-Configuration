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
        hmconf = "$EDITOR ${flakeDir}/home-manager/home.nix";
        hmpkgs = "$EDITOR ${flakeDir}/home-manager/packages.nix";

        rb = "sudo nixos-rebuild switch --flake path:${flakeDir}";
        conf = "$EDITOR ${flakeDir}/nixos/configuration.nix";
        pkgs = "$EDITOR ${flakeDir}/nixos/packages.nix";

        ll = "ls -l";
        # e = "$EDITOR";
        # de = "doas $EDITOR";
        nf = "neofetch";
      };
  };
}
