#!/usr/bin/env bash

## Default
rofi_command="rofi -theme $HOME/.config/rofi/powermenu/config.rasi"

uptime=$(uptime -p | sed -e 's/up //g' | sed -e 's/ur/ra/g' | sed -e 's/te/to/g')

# Options
ddir="$HOME"/.config/rofi/dialogs

shutdown=""
reboot=""
logout=""
lock=""
cancel="窱"

# Ask for confirmation
rdialog () {
  rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -p "Você tem certeza? : "\
    -theme "$ddir/confirm.rasi"
}

# Display Help
show_msg() {
  rofi -theme "$ddir/askpass.rasi" -e "Opções válidas: Sim / Não / Yes / No"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout\n$lock\n$cancel"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime - $uptime" -dmenu -selected-row 0)"
case $chosen in
  $shutdown)
    ans=$(rdialog | tr '[:upper:]' '[:lower:]')
    if [[ $ans == "sim" ]] || [[ $ans == "s" ]] || [[ $ans == "y" ]]; then
      systemctl poweroff
    elif [[ $ans == "no" ]] || [[ $ans == "nao" ]] || [[ $ans == "não" ]] || [[ $ans == "n" ]]; then
      exit
    else
        show_msg
    fi
  ;;
  $reboot)
    ans=$(rdialog | tr '[:upper:]' '[:lower:]')
    if [[ $ans == "sim" ]] || [[ $ans == "s" ]] || [[ $ans == "y" ]] || [[ $ans == "yes" ]]; then
      systemctl reboot
    elif [[ $ans == "nao" ]] || [[ $ans == "não" ]] || [[ $ans == "n" ]] || [[ $ans == "no" ]]; then
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
    if [[ $ans == "sim" ]] || [[ $ans == "s" ]] || [[ $ans == "y" ]] || [[ $ans == "yes" ]]; then
      bspc quit
    elif [[ $ans == "nao" ]] || [[ $ans == "não" ]] || [[ $ans == "n" ]] || [[ $ans == "no" ]]; then
      exit
    else
      show_msg
    fi
  ;;
  $cancel)
    exit
  ;;
esac

