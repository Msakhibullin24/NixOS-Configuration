{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      extraConfig = {
        enable_autosnippets = false;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        { paths = ./snippets; }
      ];
    };
    friendly-snippets.enable = true;
  };
}
