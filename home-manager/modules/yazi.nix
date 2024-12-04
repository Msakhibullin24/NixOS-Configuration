{
  programs.yazi = {
    enable = true;
    catppuccin.enable = false;

    settings = {
      opener = {
        open = [
          {
            run = ''xdg-open "$@"'';
            block = true;
            desc = "Open";
          }
          {
            run = ''swww img --transition-type=wipe --transition-bezier=".75,0,.175,1" --transition-duration="1.75" "$@"'';
            block = false;
            desc = "Wallpaper";
          }
        ];
        play = [
          {
            run = ''mpv "$@"'';
            orphan = true;
            desc = "Play";
          }
          {
            run = ''mpvpaper -f -s -o "no-audio input-ipc-server=$XDG_RUNTIME_DIR/mpv.sock --loop" '*' "$@"'';
            orphan = true;
            desc = "Wallpaper";
          }
        ];
      };
      open = {
        append_rules =
          [
          ];
      };
    };
  };
}
