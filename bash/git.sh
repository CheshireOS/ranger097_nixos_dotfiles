#!/bin/bash

dgit() {
echo " Entering dotfiles  on main."
cd ~/ranger097_nixos_dotfiles
wait
echo " Adding files to dotfiles  on main"
git add . &> /dev/null
wait
echo " Saving changes to dotfiles  on main"
git commit -m "updated configs" &> /dev/null
wait
echo " Pushing changes now."
git push origin main &> /dev/null
wait
echo " Github changes complete."
wait
echo " Building system flake..."
sudo nixos-rebuild switch --flake .#deoxy --quiet 
wait
echo " Updated dotfiles and system flake."
} >/dev/null

jgit() {
echo " Entering dotfiles  on main."
cd ~/ranger097_nixos_dotfiles
wait
echo " Adding files to dotfiles  on main"
git add . &> /dev/null
wait
echo " Saving changes to dotfiles  on main"
git commit -m "updated configs" &> /dev/null
wait
echo " Pushing changes now."
git push origin main &> /dev/null
wait
echo " Github changes complete."
wait
echo " Building system flake..."
if ! sudo nixos-rebuild switch --flake .#jirachi --quiet | grep -vE "building the system|Done|The new configuration is" > /dev/null; then
   echo "FAILURE"
   return 1
fi
}

get_dir_name() {
    case "$PWD" in
      "$HOME") echo "home" ;;
      "/") echo "root" ;;
      */ranger097_nixos_dotfiles) echo "dotfiles" ;;
      */.config) echo "configs" ;;
      *) basename "$PWD" ;;
    esac
  }

parse_git_branch() {
  local branch=$(git branch --show-current 2> /dev/null)
  if [ -n "$branch" ]; then
    echo -e "\e[33m  \e[36m$branch"
  fi
}
