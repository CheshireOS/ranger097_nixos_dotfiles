#!/usr/bin/env
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/ssh.sh
echo ""
cd /persist/home/ranger/ranger097_nixos_dotfiles
git add .
read -p "changes: " changes
git commit -m "$changes"
git push origin main 
