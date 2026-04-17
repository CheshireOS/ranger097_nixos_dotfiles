#!bin/bash
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi.sh

startup() {
wifi

direnv allow /persist/home/ranger/ranger097_nixos_dotfiles/python/theme_switcher
direnv allow /persist/home/ranger/ranger097_nixos_dotfiles/python/waybar_switcher
direnv allow /persist/home/ranger/ranger097_nixos_dotfiles/python/bluelight_toggle

awww-daemon > /dev/null 2>&1 &
direnv exec /persist/home/ranger/ranger097_nixos_dotfiles/python/theme_switcher/ python3 /persist/home/ranger/ranger097_nixos_dotfiles/python/theme_switcher/themes.py > /dev/null 2>&1
}

startup
