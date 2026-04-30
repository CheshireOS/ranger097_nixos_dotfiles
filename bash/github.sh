#!/usr/bin/env
echo ""
cd /persist/home/ranger/ranger097_nixos_dotfiles
git add .
echo "Lets save and push to github"
read -p $'\e[33m  \e[32mchanges  \e[37m| ' changes
git commit -m "$changes"
git push origin main > /dev/null 2>&1


