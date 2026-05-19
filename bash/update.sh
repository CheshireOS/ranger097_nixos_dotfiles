#!/usr/bin/env bash
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/security.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/git.sh

update() {
clear

echo "clearing space"

sudo nix-store --gc >/dev/null 2>&1
store=$?

sudo nix-collect-garbage -d >/dev/null 2>&1
garbage=$?

if [[ store -eq 0 && garbage -eq 0 ]]; then
  echo "space cleared"
fi 


cd /persist/home/ranger/ranger097_nixos_dotfiles
echo -e "\e[0;37m╭────────────────────────────╮\n\e[0;37m│  \e[0;32m \e[0;36mUpgrading Nixos System  \e[0;37m│\n╰────────────────────────────╯"

nix flake update >/dev/null 2>&1
nixflake=$?

sudo systemd-tmpfiles --remove --clean >/dev/null 2>&1
tmp=$?

if [[ nixflake -eq 0 && tmp -eq 0 ]]; then
    echo "system upgraded"
fi

if security >/dev/null 2>&1; then
   echo "system is secure"
fi

clear
echo -e "\e[0;37m╭───────────────────────╮\n\e[0;37m│   \e[0;32m󱇥 \e[0;36mUpdate Complete   \e[0;37m│\n╰───────────────────────╯"
jgit
}

