#!/run/current-system/sw/bin/bash
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi/networks.sh

startup() {
wifi_switch
awww-daemon > /dev/null 2>&1 &
cd /persist/home/ranger/ranger097_nixos_dotfiles/bash/
nix-shell --run "python3 /persist/home/ranger/ranger097_nixos_dotfiles/python/cache/theme_cache.py"
nix-shell --run "python3 /persist/home/ranger/ranger097_nixos_dotfiles/python/cache/waybar_cache.py"
}

startup
