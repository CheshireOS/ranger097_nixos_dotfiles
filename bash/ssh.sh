#!/usr/bin/env bash
source /home/ranger/ranger097_nixos_dotfiles/bash/user.sh

echo ""
echo $'\e[36mLets make a new ssh key'
git_user
printf "\n" | ssh-keygen -t ed25519 -C "$email" > /dev/null 2>&1 &
eval "$(ssh-agent -s)" > /dev/null 2>&1 &
printf "\n" | ssh-add /home/ranger/.ssh/id_ed25519 > /dev/null 2>&1 &

cd /home/ranger/ranger097_nixos_dotfiles

sweet_cream=$(cat ~/.ssh/id_ed25519.pub)
echo -e "\e[33m󱕴  \e[32mssh     \e[37m|\e[36m location \e[37m.ssh/id_ed25519.pub"
echo -e "\e[33m󰌆  key     \e[37m| \e[31m$sweet_cream\e[0m"
