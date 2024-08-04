{
  imports = [
    ./keymaps.nix
    ./options.nix
    ./autocmds.nix
    ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "latte";
    };
  };
}
