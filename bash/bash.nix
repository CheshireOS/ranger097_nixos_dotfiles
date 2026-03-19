{ config, pkgs, ... }:{
programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
nii = "cd ~/ranger097_nixos_dotfiles";
bii = "cd ~/ranger097_nixos_dotfiles/bash";
gii = "sudo nano ~/ranger097_nixos_dotfiles/ghostty/config";
hii = "sudo nano ~/ranger097_nixos_dotfiles/home.nix";
wii = "cd ~/ranger097_nixos_dotfiles/waybar";
cii = "cd ~/.config";
ls = "lsd -a";
clear = "clear && ranger_fetch";
ytdownload = "yt-dlp -x --audio-format mp3 --audio-quality 0 --cookies-from-browser firefox --embed-metadata --embed-thumbnail --add-metadata";
};
   
interactiveShellInit = ''
#!/bin/bash

source ~/ranger097_nixos_dotfiles/bash/development.sh
source ~/ranger097_nixos_dotfiles/bash/system_info.sh
source ~/ranger097_nixos_dotfiles/bash/language_info.sh
source ~/ranger097_nixos_dotfiles/bash/update.sh
source ~/ranger097_nixos_dotfiles/bash/git.sh
source ~/ranger097_nixos_dotfiles/bash/wal.sh
echo -e "\e]11;#000000\a"
printf "\e]10;%s\a" "$(sed -n '5p' ~/.cache/wal/colors)"
#pokeget random --hide-name
ranger_fetch

function git_stars() {
  gh repo view --json stargazerCount --template '{{.stargazerCount}}{{"\n"}}'
}

function git_forks() {
  gh repo view --json forkCount --template '{{.forkCount}}{{"\n"}}'
}
'';

promptInit = ''
PS1="\n\[\e[31m\]╭───\[\e[36m\]\$(get_dir_name)\$(parse_git_branch)\[\e[32m\]\$(get_lang_info)\[\e[35m\]\n\[\e[31m\]╰─\[\e[36m\]〉\[\e[0m\]"
'';

};
}

