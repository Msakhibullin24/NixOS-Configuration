#!/bin/sh
op=$( echo -e "󰐥 Poweroff\n󰜉 Reboot\n󰤄 Suspend\n󰌾 Lock\n󰈆 Logout" | wofi --width 10% --height 26% -i --dmenu | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    ;&
  reboot)
    ;&
  suspend)
      systemctl $op
    ;;
  lock)
      hyprlock
    ;;
  logout)
      hyprctl dispatch exit
    ;;
esac
