{ config, pkgs, ... }:{
programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
nii = "cd /persist/home/ranger/ranger097_nixos_dotfiles";
gii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/ghostty/config";
hii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/home.nix";
wii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/waybar";
cii = "nvim /persist/home/.config";
pii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/python";
clear = "clear && ranger_fetch";
mii = "cd /persist/home/ranger/Music/";
nvii = "nvim ~/ranger097_nixos_dotfiles/development/nixvim.nix";
	    
};
   
interactiveShellInit = ''
#!/bin/bash
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/development.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/system_info.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/language_info.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/update.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/git.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/wal.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/music.sh
export EDITOR=nvim
export VISUAL=nvim
'';

promptInit = ''
PS1='\n\[\e[0;35m\] \[\e[0;36m\]\h \[\e[0;34m\]󱕅 \[\e[0;36m ジラーチ\[\e[0;35m\]   \[\e[0;31m\] \[\e[0;36m\]$(get_dir_name)\[\e[0;36m\]$(parse_git_branch)\[\e[0;36m\]$(get_lang_info) \n\[\e[0;35m\] \[\e[0;36m\]\u \[\e[0;34m\] 󱕅 \[\e[0;36mエンジニア \[\e[0;35m\] \[\e[0;31m\] \[\e[0m\]'
'';
};
}

