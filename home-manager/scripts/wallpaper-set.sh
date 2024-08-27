#/bin/sh
SOCKET_FILE="$XDG_RUNTIME_DIR/mpv.sock"
WALLPAPER_FILE="$HOME/.wallpaper"

if [ -n "$1" ]; then
  case "$1" in
    mpvpaper-na)
      if [[  -n "$2" && -f "$2"  ]]; then
        echo "quit" | socat - $SOCKET_FILE
        swww kill
        mpvpaper -f -s -o "no-audio input-ipc-server=$SOCKET_FILE --loop" '*' $2
        cat > $WALLPAPER_FILE << EOF
mpvpaper-na
$(realpath $2)
EOF
        echo "Successful"
      else
        echo "Args error"
      fi
      ;;
    mpvpaper)
      if [[  -n "$2" && -n "$3" && -f "$2"  ]]; then
        echo "quit" | socat - $SOCKET_FILE
        swww kill
        mpvpaper -f -s -o "volume=$3 input-ipc-server=$SOCKET_FILE --loop" '*' $2
        cat > $WALLPAPER_FILE << EOF
mpvpaper
$(realpath $2)
$3
EOF
        echo "Successful"
      else
        echo "Args error"
      fi
      ;;
    swww)
      if [[  -n "$2" && -f "$2"  ]]; then
        echo "quit" | socat - $SOCKET_FILE
        swww init
        swww img $2
        cat > $WALLPAPER_FILE << EOF
swww
$(realpath $2)
EOF
        echo "Successful"
      else
        echo "Args error"
      fi
      ;;
    none)
      echo "quit" | socat - $SOCKET_FILE
      swww kill
      rm -f $WALLPAPER_FILE
      echo "Successful"
      ;;
  esac
else
  echo "Args error"
fi
