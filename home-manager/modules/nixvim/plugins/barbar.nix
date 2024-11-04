{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      next.key = "L";
      moveNext.key = "<C-S-L>";
      previous.key = "H";
      movePrevious.key = "<C-S-H>";
      close.key = "<leader>c";
    };
  };
}
