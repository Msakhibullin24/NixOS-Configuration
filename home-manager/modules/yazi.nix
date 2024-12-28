{
  programs.yazi = {
    enable = true;

    settings = {
      opener = {
        open = [
          {
            run = ''xdg-open "$@"'';
            block = true;
            desc = "Open";
          }
          {
            run = ''swww img --transition-type=grow --transition-pos="top-right" --transition-bezier=".6,.1,.5,.9" --transition-duration="0.8" --transition-fps=60 "$@"'';
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
        append_rules = [
        ];
      };
    };
  };
}
