{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "$HOME/nix";
      in {
      upd = "nix flake update path:${flakeDir}";
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

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };
}
