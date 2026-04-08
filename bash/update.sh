#!/bin/bash
source /home/ranger/ranger097_nixos_dotfiles/bash/security.sh

update() {
sudo nix-store --gc
sudo nix-collect-garbage -d
cd ~/ranger097_nixos_dotfiles
echo " Upgrading Nixos System"
nix flake update
sudo systemd-tmpfiles --remove --clean >/dev/null
security
}

