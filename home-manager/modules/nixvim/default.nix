{flavor, ...}: {
  imports = [
    ./keymaps.nix
    ./options.nix
    ./autocmds.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        inherit flavor;
      };
    };
  };
}
