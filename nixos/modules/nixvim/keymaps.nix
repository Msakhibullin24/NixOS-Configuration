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
            "<leader>c" = ":bd!<CR>";
            "<leader>a" = ":Alpha<CR>";
            "<leader>tf" = ":ToggleTerm direction=float<CR>";
            "<leader>th" = ":ToggleTerm size=10 direction=horizontal<CR>";
            "<leader>tv" = ":ToggleTerm size=80 direction=vertical<CR>";
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
