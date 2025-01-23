{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-vim
      nerdtree
    ];
    extraConfig = builtins.readFile ./config.vim;
  };
}
