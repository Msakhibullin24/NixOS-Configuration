{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nil_ls = {
          enable = true;
          settings.nix.flake.autoArchive = true;
        };
        bashls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        jsonls.enable = true;
        html.enable = true;
        htmx.enable = true;
        cssls.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;
        svelte.enable = true;
        marksman.enable = true;
        eslint.enable = true;
        emmet_ls.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto definition";
          };
          gr = {
            action = "references";
            desc = "Goto references";
          };
          gD = {
            action = "declaration";
            desc = "Goto declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type defenition";
          };
          "<leader>CR" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };
  };
}
