{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {paths = ./snippets;}
      ];
    };
    friendly-snippets.enable = true;
  };
}
