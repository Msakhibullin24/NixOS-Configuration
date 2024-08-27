{
  programs.nixvim.plugins.which-key = {
    enable = true;

    triggersBlackList = {
      n = [
        "s"
      ];
      i = [
        "j"
        "k"
      ];
      v = [
        "j"
        "k"
        "s"
      ];
    };

    triggersNoWait = [
      "`"
      "'"
      "g`"
      "g'"
      "\""
      "<c-r>"
      "z="
    ];
  };
}
