{config, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = config.lib.nixvim.keymaps.mkKeymaps {options.silent = true;} [
      {
        mode = "n";
        key = "<esc>";
        action = ":noh<CR>";
        options.desc = "Disable highlight";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        options.desc = "Neotree";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.desc = "Save";
      }
      {
        mode = "n";
        key = "<leader>q";
        action = ":qa<CR>";
        options.desc = "Quit";
      }
      {
        mode = "n";
        key = "<leader>Q";
        action = ":qa!<CR>";
        options.desc = "Quit anyway";
      }
      {
        mode = "n";
        key = "<leader>a";
        action = ":Alpha<CR>";
        options.desc = "Alpha";
      }
      {
        mode = "n";
        key = "<leader>tf";
        action = ":ToggleTerm direction=float<CR>";
        options.desc = "Float";
      }
      {
        mode = "n";
        key = "<leader>th";
        action = ":ToggleTerm size=10 direction=horizontal<CR>";
        options.desc = "Horizontal";
      }
      {
        mode = "n";
        key = "<leader>tv";
        action = ":ToggleTerm size=80 direction=vertical<CR>";
        options.desc = "Vertical";
      }
      {
        mode = "n";
        key = "<leader>db";
        action.__raw = ''function() require("dap").toggle_breakpoint() end'';
        options.desc = "Break";
      }
      {
        mode = "n";
        key = "<leader>dc";
        action.__raw = ''function() require("dap").continue() end'';
        options.desc = "Continue";
      }
      {
        mode = "n";
        key = "<leader>di";
        action.__raw = ''function() require("dap").step_into() end'';
        options.desc = "Step into";
      }
      {
        mode = "n";
        key = "<leader>do";
        action.__raw = ''function() require("dap").step_out() end'';
        options.desc = "Step out";
      }
      {
        mode = "n";
        key = "<leader>dO";
        action.__raw = ''function() require("dap").step_over() end'';
        options.desc = "Step over";
      }
      {
        mode = "n";
        key = "<leader>dr";
        action.__raw = ''function() require("dap").repl.toggle() end'';
        options.desc = "Repl";
      }
      {
        mode = "n";
        key = "<leader>ds";
        action.__raw = ''function() require("dap").session() end'';
        options.desc = "Session";
      }
      {
        mode = "n";
        key = "<leader>dt";
        action.__raw = ''function() require("dap").terminate() end'';
        options.desc = "Terminate";
      }
      {
        mode = ["n" "v"];
        key = "<leader>de";
        action.__raw = ''function() require("dapui").eval() end'';
        options.desc = "UI eval";
      }
      {
        mode = "n";
        key = "<leader>du";
        action.__raw = ''function() require("dapui").toggle() end'';
        options.desc = "UI Toggle";
      }
      {
        mode = "n";
        key = "<leader>dw";
        action.__raw = ''function() require("dap.ui.widgets").hover() end'';
        options.desc = "UI widgets hover";
      }
      {
        mode = ["n" "v"];
        key = "<leader>lf";
        action = ":Format<CR>";
        options.desc = "Format";
      }
      {
        mode = ["n" "v"];
        key = "<leader>lte";
        action = ":FormatEnable<CR>";
        options.desc = "Re-enable format";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ltd";
        action = ":FormatDisable!<CR>";
        options.desc = "Disable format localy";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ltD";
        action = ":FormatDisable<CR>";
        options.desc = "Disable format globaly";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ltf";
        action = ":FormatToggle!<CR>";
        options.desc = "Toggle format localy";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ltF";
        action = ":FormatToggle<CR>";
        options.desc = "Toggle format globaly";
      }
      {
        mode = ["n" "v"];
        key = "<leader>li";
        action = ":LspInfo<CR>";
        options.desc = "Info";
      }
      {
        mode = ["n" "v"];
        key = "<leader>lS";
        action = ":LspStart<CR>";
        options.desc = "Start";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ls";
        action = ":LspStop<CR>";
        options.desc = "Stop";
      }
      {
        mode = ["n" "v"];
        key = "<leader>lr";
        action = ":LspRestart<CR>";
        options.desc = "Restart";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
      }
      {
        mode = "n";
        key = "<C-Up>";
        action = ":resize -2<CR>";
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = ":resize +2<CR>";
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = ":vertical resize +2<CR>";
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = ":vertical resize -2<CR>";
      }
      {
        mode = "n";
        key = "<M-k>";
        action = ":m-2<CR>";
      }
      {
        mode = "n";
        key = "<M-j>";
        action = ":m+1<CR>";
      }

      {
        mode = "i";
        key = "jk";
        action = "<escape>";
      }
      {
        mode = "i";
        key = "kj";
        action = "<escape>";
      }

      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = ["v" "x"];
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }
      {
        mode = ["v" "x"];
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }

      {
        mode = "t";
        key = "<esc>";
        action = "<C-\\><C-n>";
      }
      {
        mode = "t";
        key = "jk";
        action = "<C-\\><C-n>";
      }
      {
        mode = "t";
        key = "kj";
        action = "<C-\\><C-n>";
      }
      {
        mode = "t";
        key = "<C-h>";
        action = "<C-\\><C-n><C-w>h";
      }
      {
        mode = "t";
        key = "<C-j>";
        action = "<C-\\><C-n><C-w>j";
      }
      {
        mode = "t";
        key = "<C-k>";
        action = "<C-\\><C-n><C-w>k";
      }
      {
        mode = "t";
        key = "<C-l>";
        action = "<C-\\><C-n><C-w>l";
      }
    ];
  };
}
