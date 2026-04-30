#!/run/current-system/sw/bin/bash

security() {
cd
sudo systemd-tmpfiles --remove --clean >/dev/null
sudo nix-store --gc
sudo nix-collect-garbage -d
rm -rf .bash_history-*.tmp
rm -rf .tor
rm -rf .wget-hsts
}

