{
  programs.nixvim.plugins.which-key = {
    enable = true;

    settings = {
      triggers_black_list = {
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

      triggers_no_wait = [
        "`"
        "'"
        "g`"
        "g'"
        "\""
        "<c-r>"
        "z="
      ];
    };
  };
}
