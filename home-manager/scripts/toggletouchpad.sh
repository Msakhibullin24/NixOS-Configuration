#!/bin/sh
HYPRLAND_DEVICE="elan0300:00-04f3:31ff-touchpad"

STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
  printf "ON" > "$STATUS_FILE"
  hyprctl keyword "device[$HYPRLAND_DEVICE]:enabled" true
}

disable_touchpad() {
  printf "OFF" > "$STATUS_FILE"
  hyprctl keyword "device[$HYPRLAND_DEVICE]:enabled" false
}

if ! [ -f "$STATUS_FILE" ]; then
  disable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "ON" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "OFF" ]; then
    enable_touchpad
  fi
fi
