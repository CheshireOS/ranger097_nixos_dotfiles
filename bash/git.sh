#!/bin/bash

dgit() {
echo " Entering dotfiles  on main."
cd ~/ranger097_nixos_dotfiles
wait
echo " Adding files to dotfiles  on main"
git add . &> /dev/null
wait
echo " Building system flake..."
sudo nixos-rebuild switch --flake .#deoxy --quiet 
wait
echo " Updated dotfiles and system flake."
if ! sudo nixos-rebuild switch --flake .#jirachi --quiet > /dev/null; then
   echo "FAILURE"
   return 1
fi
sudo systemd-tmpfiles --remove --clean >/dev/null
}

jgit() {
echo " Entering dotfiles  on main."
cd ~/ranger097_nixos_dotfiles
wait
echo " Adding files to dotfiles  on main"
git add . &> /dev/null
wait
echo " Building system flake..."
if ! sudo nixos-rebuild switch --flake .#jirachi --quiet > /dev/null; then
   echo "FAILURE"
   return 1
fi
sudo systemd-tmpfiles --remove --clean >/dev/null
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
    echo -e "\e[30m  \e[33m$branch"
  fi
}
