{ pkgs, ... }:
let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = false;
    vimAlias = false;
    vimdiffAlias = false;

    extraPackages = with pkgs; [
      fzf
      fd

      # LSP
      nil
      lua-language-server
      bash-language-server
      pyright
      vscode-langservers-extracted
      htmx-lsp
      tailwindcss-language-server
      typescript-language-server
      svelte-language-server
      marksman
      emmet-language-server
      # emmet-ls
      omnisharp-roslyn
      neocmakelsp

      # Formatters
      nixfmt-rfc-style
      stylua
      uncrustify
      shfmt
      black
      nodePackages.prettier
      prettierd
      superhtml
      nodePackages.stylelint
      codespell
      csharpier
      cmake-format
      eslint

      # LSP + Formatters
      clang-tools
      gdtoolkit_4

      # Debugger
      vscode-extensions.vadimcn.vscode-lldb
    ];

    plugins =
      (with pkgs.vimPlugins; [
        # Themes
        catppuccin-nvim

        # RPC
        {
          plugin = presence-nvim;
          config = toLuaFile ./plugins/presence.lua;
        }

        # Dependencies
        nvim-web-devicons

        # Visual
        transparent-nvim
        nvim-colorizer-lua
        {
          plugin = alpha-nvim;
          config = toLuaFile ./plugins/alpha.lua;
        }
        {
          plugin = neo-tree-nvim;
          config = toLuaFile ./plugins/neotree.lua;
        }
        {
          plugin = barbar-nvim;
          config = toLuaFile ./plugins/barbar.lua;
        }
        {
          plugin = lualine-nvim;
          config = toLuaFile ./plugins/lualine.lua;
        }
        {
          plugin = noice-nvim;
          config = toLuaFile ./plugins/noice.lua;
        }

        # Useful tools
        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugins/telescope.lua;
        }
        telescope-fzf-native-nvim
        {
          plugin = toggleterm-nvim;
          config = toLuaFile ./plugins/toggleterm.lua;
        }
        {
          plugin = mini-nvim;
          config = toLuaFile ./plugins/mini.lua;
        }
        {
          plugin = comment-nvim;
          config = toLuaFile ./plugins/comment.lua;
        }
        {
          plugin = nvim-surround;
          config = toLuaFile ./plugins/surround.lua;
        }
        {
          plugin = nvim-autopairs;
          config = toLuaFile ./plugins/autopairs.lua;
        }
        {
          plugin = nvim-ts-autotag;
          config = toLuaFile ./plugins/ts-autotag.lua;
        }
        {
          plugin = gitsigns-nvim;
          config = toLuaFile ./plugins/gitsigns.lua;
        }
        tagbar

        # LSP
        {
          plugin = nvim-lspconfig;
          config = toLua ''
            local omnisharp_bin = "${pkgs.omnisharp-roslyn}/bin/OmniSharp"
            ${builtins.readFile ./plugins/lsp/lspconfig.lua}
          '';
        }
        {
          plugin = fidget-nvim;
          config = toLuaFile ./plugins/lsp/fidget.lua;
        }
        {
          plugin = trouble-nvim;
          config = toLuaFile ./plugins/lsp/trouble.lua;
        }
        {
          plugin = conform-nvim;
          config = toLuaFile ./plugins/lsp/conform.lua;
        }

        # Complete
        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugins/cmp.lua;
        }
        cmp_luasnip
        cmp-cmdline
        cmp-cmdline-history
        cmp-buffer
        cmp-path
        cmp-dap
        cmp-nvim-lsp
        {
          plugin = luasnip;
          config = toLuaFile ./plugins/luasnip.lua;
        }
        friendly-snippets

        # Debug
        {
          plugin = nvim-dap;
          config = toLua ''
            local codelldb_bin = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb"
            ${builtins.readFile ./plugins/dap.lua}
          '';
        }
        {
          plugin = nvim-dap-ui;
          config = toLuaFile ./plugins/dap-ui.lua;
        }
        nvim-dap-python
        nvim-dap-virtual-text

        # Highlight
        {
          plugin = nvim-treesitter.withAllGrammars;
          config = toLuaFile ./plugins/treesitter.lua;
        }
        nvim-treesitter-refactor

        # Nix
        vim-nix
      ])
      ++ (with pkgs.stable.vimPlugins; [ nvim-treesitter-parsers.gdscript ]);

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./autocmds.lua}
    '';
  };
}
