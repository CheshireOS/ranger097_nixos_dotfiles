#!/run/current-system/sw/bin/bash
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/security.sh

update() {
sudo nix-store --gc
sudo nix-collect-garbage -d
cd ~/ranger097_nixos_dotfiles
echo " Upgrading Nixos System"
nix flake update
sudo systemd-tmpfiles --remove --clean >/dev/null
security
clear
echo -e "\e[0;37m╭───────────────────────╮\n\e[0;37m│   \e[0;32m󱇥 \e[0;36mUpdate Complete   \e[0;37m│\n╰───────────────────────╯"
}

