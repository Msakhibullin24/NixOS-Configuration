{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>sl" = "resume";

      # "<leader>fd" = "diagnostics";
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fh" = "help_tags";
      "<leader>fm" = "marks";

      "<leader>b" = "buffers";
      "<leader>gf" = "git_files";
      "<leader>of" = "oldfiles";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^.__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
