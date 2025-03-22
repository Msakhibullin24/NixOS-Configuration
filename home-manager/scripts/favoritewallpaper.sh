#!/usr/bin/env bash
if ! [ "$#" -lt 2 ] && ! [ "$#" -gt 2 ]; then
  if ! [ -d "$1" ]; then
    echo "Invalid directory!"
    exit
  fi
  echo "quit" | socat "$XDG_RUNTIME_DIR/mpv.sock" -
  hyprctl dispatch exec swww-daemon
  swww img "$1/favorite/$2."* --transition-type=grow --transition-pos="top-right" --transition-bezier=".6,.1,.5,.9" --transition-duration="0.8" --transition-fps=60
else
  echo "Argument error!"
fi
