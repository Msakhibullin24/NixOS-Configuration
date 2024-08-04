{
  programs.bash = {
    enable = true;
    shellAliases = 
    let
      flakeDir = "~/nix";
    in {
      upd = "nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";
      hmconf = "nvim ${flakeDir}/home-manager/home.nix";
      hmpkgs = "nvim ${flakeDir}/home-manager/packages.nix";

      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      conf = "nvim ${flakeDir}/nixos/configuration.nix";
      pkgs = "nvim ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";
      v = "nvim";
      de = "doas nvim";
      nf = "neofetch";
    };
  };
}
