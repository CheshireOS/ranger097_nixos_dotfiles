#!/usr/bin/env
echo ""
echo $'\e[36mLets make a new ssh key'
read -p $'\e[33m  \e[32mname\e[37m    | \e[0m' name
read -p $'\e[33m󰶍  \e[32memail\e[37m   | \e[0m' email

new_ssh() {
printf "\n" | ssh-keygen -t ed25519 -C "$email" > /dev/null 2>&1 &
eval "$(ssh-agent -s)" > /dev/null 2>&1 &
printf "\n" | ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1 &
}

new_user() {
git config --global user.name "$name" > /dev/null 2>&1 &
git config --global user.email "$email" > /dev/null 2>&1 &
}

make_ssh() {
cd /persist/home/ranger/ranger097_nixos_dotfiles
new_ssh
new_user
sweet_cream=$(< ~/.ssh/id_ed25519.pub)
echo -e "\e[33m󱕴  \e[32mssh     \e[37m|\e[36m location \e[37m.ssh/id_ed25519.pub"
echo -e "\e[33m󰌆  key     \e[37m| \e[31m$sweet_cream\e[0m"
}

make_ssh
