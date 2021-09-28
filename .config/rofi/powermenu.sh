#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# Column_circle     Column_square     Column_rounded     Column_alt
# Card_circle     	Card_square       Card_rounded       Card_alt
# Dock_circle     	Dock_square       Dock_rounded       Dock_alt
# Drop_circle     	Drop_square       Drop_rounded       Drop_alt
# Full_circle     	Full_square       Full_rounded       Full_alt
# Row_circle      	Row_square        Row_rounded        Row_alt

## Default
rofi_command="rofi -theme $HOME/.config/rofi/powermenu/config.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
ddir="$HOME"/.config/rofi/dialogs

shutdown=""
reboot=""
logout=""
lock=""

# Ask for confirmation
rdialog () {
  rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -p "Are You Sure? : "\
    -theme "$ddir/confirm.rasi"
}

# Display Help
show_msg() {
  rofi -theme "$ddir/askpass.rasi" -e "Options : yes / no / y / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout\n$lock"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
  $shutdown)
    ans=$(rdialog | tr '[:upper:]' '[:lower:]')
    if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
      systemctl poweroff
    elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
      exit
    else
        show_msg
    fi
  ;;
  $reboot)
    ans=$(rdialog | tr '[:upper:]' '[:lower:]')
    if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
      systemctl reboot
    elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
      exit
    else
      show_msg
    fi
  ;;
  $lock)
    betterlockscreen --lock
  ;;
  $logout)
    ans=$(rdialog | tr '[:upper:]' '[:lower:]')
    if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
      bspc quit
    elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
      exit
    else
      show_msg
    fi
  ;;
esac

