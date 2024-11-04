{
  programs.nixvim.plugins.mini = {
    enable = true;

    mockDevIcons = true;

    modules = {
      align = {};
      basics = {
        options.extra_ui = true;
      };
      clue = {};
      cursorword = {};
      doc = {};
      extra = {};
      indentscope = {};
      trailspace = {};
      misc = {};
      surround = {};
      icons = {};
    };
  };
}
