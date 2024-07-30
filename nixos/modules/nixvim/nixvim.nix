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
    colorschemes.oxocarbon.enable = true;
  };
}
