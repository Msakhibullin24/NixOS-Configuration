{
  programs.yazi = {
    enable = true;
    catppuccin.enable = false;

    theme.status = {
      separator_open  = "";
      separator_close = "";
    };

    settings = {
      opener = {
        open = [
          { run = ''xdg-open "$@"''; block = true; desc = "Open"; }
          { run = ''wallpaper-set swww "$@"''; block = false; desc = "Wallpaper"; }
        ];
        play = [
          { run = ''mpv "$@"''; orphan = true; desc = "Play"; }
          { run = ''wallpaper-set mpvpaper-na "$@"''; orphan = true; desc = "Wallpaper"; }
        ];
      };
      open = {
        append_rules = [
        ];
      };
    };
  };
}
