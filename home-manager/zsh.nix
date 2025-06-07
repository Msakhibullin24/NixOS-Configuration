{
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

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
