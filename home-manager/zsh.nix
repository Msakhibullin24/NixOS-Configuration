{ config, pkgs, ... }: {
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
      vg = "nvim --listen ./godothost";
      de = "doas nvim";
      nf = "neofetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      {
        name = "powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
