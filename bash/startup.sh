#!/usr/bin/env
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi/networks.sh

startup() {
wifi_switch

if pgrep awww >/dev/null; then
  echo "awww-daemon already running"
else
  echo "awww-daemon wasnt running"
  awww-daemon > /dev/null 2>&1 &
fi

for dir in theme_switcher bluelight_toggle waybar_switcher cache; do
cd /persist/home/ranger/ranger097_nixos_dotfiles/python/$dir 
direnv allow "/persist/home/ranger/ranger097_nixos_dotfiles/python/$dir" > /dev/null 2>&1 &
sleep 0.5
done

DIR="/persist/home/ranger/ranger097_nixos_dotfiles/python/cache"
for file in theme_cache.py waybar_cache.py bluelight_toggle.py; do
direnv exec "$DIR" python3 "$DIR/$file" > /dev/null 2>&1 &
sleep 0.5
done

disown -a
}

startup
