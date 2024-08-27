{ pkgs, ... }: {
  programs.nixvim = {
    plugins.dap = {
      enable = true;

      extensions = {
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = [ "<esc>" "q" ];
          };
          controls = {
            enabled = true;
            element = "console";
          };
        };
        dap-python = {
          enable = true;
        };
        dap-virtual-text.enable = true;
      };

      adapters = {
        servers = {
          codelldb = {
            port = "\${port}";
            executable = {
              command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
              args = [ "--port" "\${port}" ];
            };
          };
          godot = {
            host = "127.0.0.1";
            port = 6006;
          };
        };

        executables = {};
      };

      configurations = {
        cpp = [
          {
            name = "Launch via codelldb";
            type = "codelldb";
            request = "launch";
            program.__raw = ''
              function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
              end
            '';
            cwd = "\${workspaceFolder}";
            stopOnEntry = false;
            runInTerminal = true;
            terminal = "integrated";
            args = {};
          }
        ];
        gdscript = [
          {
            name = "Launch scene";
            type = "godot";
            request = "launch";
            project = "\${workspaceFolder}";
            launch_scene = true;
          }
        ];
      };
    };

    extraConfigLua = ''
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
    '';
  };
}
