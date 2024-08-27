{ config, lib, ... }: {
  programs.nixvim = {
    globals = {
      mapleader = "\ ";
      maplocalleader = "\ ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList (
          key: action: {
            mode = "n";
            inherit action key;
          }
        )
        {
          "<esc>" = ":noh<CR>";
          "<leader>e" = ":Neotree toggle<CR>";
          "<leader>w" = ":w<CR>";
          "<leader>q" = ":qa<CR>";
          "<leader>a" = ":Alpha<CR>";
          "<leader>tf" = ":ToggleTerm direction=float<CR>";
          "<leader>th" = ":ToggleTerm size=10 direction=horizontal<CR>";
          "<leader>tv" = ":ToggleTerm size=80 direction=vertical<CR>";
          "<leader>db".__raw = ''function() require("dap").toggle_breakpoint() end'';
          "<leader>dc".__raw = ''function() require("dap").continue() end'';
          "<leader>di".__raw = ''function() require("dap").step_into() end'';
          "<leader>do".__raw = ''function() require("dap").step_out() end'';
          "<leader>dO".__raw = ''function() require("dap").step_over() end'';
          "<leader>dr".__raw = ''function() require("dap").repl.toggle() end'';
          "<leader>ds".__raw = ''function() require("dap").session() end'';
          "<leader>dt".__raw = ''function() require("dap").terminate() end'';
          "<leader>de".__raw = ''function() require("dapui").eval() end'';
          "<leader>du".__raw = ''function() require("dapui").toggle() end'';
          "<leader>dw".__raw = ''function() require("dap.ui.widgets").hover() end'';
          "<C-h>" = "<C-w>h";
          "<C-j>" = "<C-w>j";
          "<C-k>" = "<C-w>k";
          "<C-l>" = "<C-w>l";
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";
          # "H" = ":BufferPrevious<CR>";
          # "L" = ":BufferNext<CR>";
          "<M-k>" = ":move-2<CR>";
          "<M-j>" = ":move+1<CR>";
        };
      input =
        lib.mapAttrsToList (
          key: action: {
            mode = "i";
            inherit action key;
          }
        )
        {
          "jk" = "<escape>";
          "kj" = "<escape>";
        };
      visual =
        lib.mapAttrsToList(
          key: action: {
            mode = "v";
            inherit action key;
          }
        )
        {
          "<leader>de".__raw = ''function() require("dapui").eval() end'';
          ">" = ">gv";
          "<" = "<gv";
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
      block =
        lib.mapAttrsToList(
          key: action: {
            mode = "x";
            inherit action key;
          }
        )
        {
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
      terminal =
        lib.mapAttrsToList(
          key: action: {
            mode = "t";
            inherit action key;
          }
        )
        {
          "<esc>" = "<C-\\><C-n>";
          "jk" = "<C-\\><C-n>";
          "kj" = "<C-\\><C-n>";
          "<C-h>" = "<C-\\><C-n><C-w>h";
          "<C-j>" = "<C-\\><C-n><C-w>j";
          "<C-k>" = "<C-\\><C-n><C-w>k";
          "<C-l>" = "<C-\\><C-n><C-w>l";
        };
    in
      config.nixvim.helpers.keymaps.mkKeymaps
      { options.silent = true; }
      ( normal ++ input ++ visual ++ block ++ terminal );
  };
}
