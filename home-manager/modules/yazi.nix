{
  programs.yazi = {
    enable = true;

    settings = {
      tasks = {
        image_alloc = 0;
        image_bound = [
          16000
          9000
        ];
      };
      opener = {
        open = [
          {
            run = ''xdg-open "$@"'';
            block = true;
            desc = "Open";
          }
          {
            run = ''echo "quit" | socat "$XDG_RUNTIME_DIR/mpv.sock" -; hyprctl dispatch exec swww-daemon; swww img --transition-type=grow --transition-pos="top-right" --transition-bezier=".7,.1,.5,.9" --transition-duration="0.8" --transition-fps=60 "$@"'';
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
            run = ''swww kill; echo "quit" | socat "$XDG_RUNTIME_DIR/mpv.sock" -; mpvpaper -f -s -o "no-audio input-ipc-server=$XDG_RUNTIME_DIR/mpv.sock --loop" '*' "$@"'';
            orphan = true;
            desc = "Wallpaper";
          }
        ];
      };
    };
  };
}
