{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    addBlankLineAtTop = false;
    autoCleanAfterSessionRestore = true;
    useDefaultMappings = false;
    closeIfLastWindow = true;
    window = {
      position = "left";
      width = 30;
      mappings = {
        "<esc>" = "cancel";
        "<" = "prev_source";
        ">" = "next_source";
        "a" = "add";
        "A" = "add_directory";
        "c" = "copy";
        "d" = "delete";
        "i" = "show_file_details";
        "l" = "open";
        "m" = "move";
        "p" = "paste_from_clipboard";
        "q" = "close_window";
        "r" = "rename";
        "R" = "refresh";
        "s" = "open_vsplit";
        "S" = "open_split";
        "t" = "open_tabnew";
        "x" = "cut_to_clipboard";
        "y" = "copy_to_clipboard";
      };
    };
    filesystem = {
      followCurrentFile.enabled = true;
      window = {
        mappings = {
          "<C-x>" = "clear_filter";
          "." = "set_root";
          "/" = "fuzzy_finder";
          "#" = "fuzzy_sorter";
          "[g" = "prev_git_modified";
          "g]" = "next_git_modified";
          "D" = "fuzzy_finder_directory";
          "f" = "filter_on_submit";
          "h" = "navigate_up";
          "H" = "toggle_hidden";
          "o" = "show_help";
          "oc" = "order_by_created";
          "od" = "order_by_diagnostics";
          "og" = "order_by_git_status";
          "om" = "order_by_modified";
          "on" = "order_by_name";
          "os" = "order_by_size";
          "ot" = "order_by_type";
        };
      };
    };
    buffers = {
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = false;
      };
      groupEmptyDirs = true;
      window = {
        mappings = {
          "." = "set_root";
          "bd" = "buffer_delete";
          "h" = "navigate_up";
          "o" = "show_help";
          "oc" = "order_by_created";
          "od" = "order_by_diagnostics";
          "og" = "order_by_git_status";
          "om" = "order_by_modified";
          "on" = "order_by_name";
          "os" = "order_by_size";
          "ot" = "order_by_type";
        };
      };
    };
    gitStatus = {
      window = {
        mappings = {
          "A" = "git_add_all";
          "gu" = "git_unstage_file";
          "ga" = "git_add_file";
          "gr" = "gir_revert_file";
          "gc" = "git_commit";
          "gp" = "git_push";
          "gg" = "git_commit_and_push";
          "o" = "show_help";
          "oc" = "order_by_created";
          "od" = "order_by_diagnostics";
          "og" = "order_by_git_status";
          "om" = "order_by_modified";
          "on" = "order_by_name";
          "os" = "order_by_size";
          "ot" = "order_by_type";
        };
      };
    };
  };
}
