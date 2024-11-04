{
  programs.nixvim = {
    extraConfigLuaPre = ''
      vim.api.nvim_create_user_command("Format", function(args)
        -- if vim.g.disable_autoformat or vim.b.disable_autoformat then
        --   return
        -- end
        vim.lsp.buf.format {}
      end, {
        desc = "Format buffer",
      })
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function(args)
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        if args.bang then
          vim.b.disable_autoformat = not vim.b.disable_autoformat
        else
          vim.g.disable_autoformat = not vim.g.disable_autoformat
        end
      end, {
        desc = "Toggle autoformat-on-save",
        bang = true,
      })
    '';
    plugins.none-ls = {
      enable = true;
      settings = {
        updateInInsert = false;
        on_attach = ''
          function(client, bufnr)
            if client.supports_method "textDocument/formatting" then
              vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                  end
                  vim.lsp.buf.format { bufnr = bufnr }
                end,
              })
            end
          end
        '';
      };
      sources = {
        code_actions = {
          gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          credo.enable = true;
          statix.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          black = {
            enable = true;
            settings.extra_args = ["--fast"];
          };
          clang_format.enable = true;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            settings.extra_args = ["--no-semi" "--single-quote"];
          };
          stylua.enable = true;
        };
      };
    };
  };
}
