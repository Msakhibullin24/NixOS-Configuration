{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      timeoutlen = 500;
      updatetime = 100;
      relativenumber = true;
      number = true;
      hidden = true;
      mouse = "a";
      mousemodel = "extend";
      swapfile = false;
      modeline = true;
      modelines = 100;
      undofile = true;
      incsearch = true;
      inccommand = "split";
      ignorecase = true;
      smartcase = true;
      scrolloff = 12;
      cursorline = false;
      cursorcolumn = false;
      signcolumn = "yes";
      colorcolumn = "100";
      laststatus = 3;
      fileencoding = "utf-8";
      termguicolors = false;
      spell = false;
      wrap = false;
      tabstop = 2;
      shiftwidth = 2;
      shiftround = true;
      expandtab = true;
      autoindent = true;
      textwidth = 0;
      foldlevel = 99;
      showmatch = true;
      splitright = true;
      splitbelow = true;
      fixeol = true;
      completeopt = [
        "menu"
        "menuone"
        "noselect"
      ];
    };
  };
}
