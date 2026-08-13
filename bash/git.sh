#!/run/current-system/sw/bin/bash
source /home/ranger/ranger097_nixos_dotfiles/bash/security.sh

dgit() {
echo ""
echo -e "\e[0;32m \e[0;36mEntering dotfiles \e[0;32m \e[0;36mon main."
cd /home/ranger/ranger097_nixos_dotfiles
wait
echo -e "\e[0;32m \e[0;36mAdding files to dotfiles \e[0;32m \e[0;36mon main"
git add . &> /dev/null
wait
echo -e "\e[0;32m \e[0;36mBuilding system flake..."
sudo nixos-rebuild switch --flake .#deoxy --quiet 
wait
echo -e "\e[0;32m \e[0;36mUpdated dotfiles and system flake."
if ! sudo nixos-rebuild switch --flake .#jirachi --quiet > /dev/null; then
   echo "FAILURE"
   return 1
else
security
clear
echo -e "\e[0;37m╭────────────────────╮\n\e[0;37m│   \e[0;32m󱇥 \e[0;36mDone & Done    \e[0;37m│\n╰────────────────────╯"
fi
}

jgit() {
echo ""
echo -e "\e[0;32m \e[0;36mEntering dotfiles \e[0;32m \e[0;36mon main."
cd /home/ranger/ranger097_nixos_dotfiles
wait
echo -e "\e[0;32m \e[0;36mAdding files to dotfiles \e[0;32m \e[0;36mon main"
git add . &> /dev/null
wait
echo -e "\e[0;32m \e[0;36mBuilding system flake..."
sudo nixos-rebuild switch --flake .#jirachi --quiet 
wait
echo -e "\e[0;32m \e[0;36mUpdated dotfiles and system flake."
if ! sudo nixos-rebuild switch --flake .#jirachi --quiet > /dev/null; then
   echo "FAILURE"
   return 1
else
security
clear
echo -e "\e[0;37m╭────────────────────╮\n\e[0;37m│   \e[0;32m󱇥 \e[0;36mDone & Done    \e[0;37m│\n╰────────────────────╯"
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
    echo -e "\e[32m  \e[36mon $branch"
  fi
}
