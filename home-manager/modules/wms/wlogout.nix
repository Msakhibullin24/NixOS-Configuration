{
  programs.wlogout = {
    enable = true;
    style = builtins.readFile ./wlogout.css;
  };
}
