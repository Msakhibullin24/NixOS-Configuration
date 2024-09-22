{
  programs.nixvim.plugins = {
    autoclose = {
      enable = true;
      keys = {
        "(" = { escape = false; close = true; pair = "()"; };
        "[" = { escape = false; close = true; pair = "[]"; };
        "{" = { escape = false; close = true; pair = "{}"; };
        # "<" = { escape = false; close = true; pair = "<>"; };
      };
      options = {
        disableWhenTouch = true;
      };
    };
    # ts-autotag.enable = true;
  };
}
