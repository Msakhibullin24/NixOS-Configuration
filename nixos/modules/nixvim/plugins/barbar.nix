{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      next.key = "L";
      previous.key = "H";
      close.key = "<leader>c";
    };
  };
}
