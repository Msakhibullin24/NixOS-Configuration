#!/bin/sh
SOCKET_FILE="$XDG_RUNTIME_DIR/mpv.sock"
WALLPAPER_FILE="$HOME/.wallpaper"

if [[  -f "$WALLPAPER_FILE"  ]]; then
  a=$(cat $WALLPAPER_FILE | sed 2,3d)
  case $a in
    mpvpaper-na)
      echo "quit" | socat - $SOCKET_FILE
      swww kill
      b=$(cat $WALLPAPER_FILE | sed 1d)
      mpvpaper -f -s -o "no-audio input-ipc-server=$SOCKET_FILE --loop" '*' $b
      ;;
    mpvpaper)
      echo "quit" | socat - $SOCKET_FILE
      swww kill
      b=$(cat $WALLPAPER_FILE | sed 1d | sed 3d)
      c=$(cat $WALLPAPER_FILE | sed 1,2d)
      echo $b
      echo $c
      mpvpaper -f -s -o "volume=$c input-ipc-server=$SOCKET_FILE --loop" '*' $b
      ;;
    swww)
      echo "quit" | socat - $SOCKET_FILE
      swww init
      b=$(cat $WALLPAPER_FILE | sed 1d)
      swww img $b
      ;;
  esac
else
  swww init
fi
