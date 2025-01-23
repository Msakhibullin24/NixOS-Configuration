#!/usr/bin/env bash
if ! [ "$#" -lt 1 ] && ! [ "$#" -gt 1 ]; then
  if ! [ -d "$1" ]; then
    echo "Invalid directory!"
    exit
  fi
  if ! [ -f "$1/.wallpapers" ] || ! [ -s "$1/.wallpapers" ]; then
    find "$1" -maxdepth 1 -name "*.png" | sort -Vk1 >"$1/.wallpapers"
  fi
  wallpaper=$(shuf -n1 <"$1/.wallpapers")
  sed -i "\%${wallpaper//\*/\\*}%d" "$1/.wallpapers"
  if [ -f "$wallpaper" ]; then
    swww img "$wallpaper" --transition-type=grow --transition-pos="top-right" --transition-bezier=".6,.1,.5,.9" --transition-duration="0.8" --transition-fps=60
  fi
else
  echo "Argument error!"
fi
