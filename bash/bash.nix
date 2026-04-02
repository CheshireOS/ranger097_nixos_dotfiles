{ config, pkgs, ... }:{
programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
nii = "cd ~/ranger097_nixos_dotfiles";
bii = "nvim ~/ranger097_nixos_dotfiles/bash";
gii = "nvim ~/ranger097_nixos_dotfiles/ghostty/config";
hii = "nvim ~/ranger097_nixos_dotfiles/home.nix";
wii = "nvim ~/ranger097_nixos_dotfiles/waybar";
cii = "nvim ~/.config";
clear = "clear && ranger_fetch";
ytd = "yt-dlp -x --audio-format mp3 --audio-quality 0 --cookies-from-browser firefox --embed-metadata --embed-thumbnail --add-metadata";
nvii = "nvim ~/ranger097_nixos_dotfiles/development/nixvim.nix";
	    
};
   
interactiveShellInit = ''
#!/bin/bash
source ~/ranger097_nixos_dotfiles/bash/development.sh
source ~/ranger097_nixos_dotfiles/bash/system_info.sh
source ~/ranger097_nixos_dotfiles/bash/language_info.sh
source ~/ranger097_nixos_dotfiles/bash/update.sh
source ~/ranger097_nixos_dotfiles/bash/git.sh
source ~/ranger097_nixos_dotfiles/bash/wal.sh
export EDITOR=nvim
export VISUAL=nvim
'';

promptInit = ''
PS1='\n\[\e[0;35m\] \[\e[0;36m\]\h \[\e[0;34m\]󱕅 \[\e[0;36m ジラーチ\[\e[0;35m\]   \[\e[0;31m\] \[\e[0;36m\]$(get_dir_name)\[\e[0;36m\]$(parse_git_branch)\[\e[0;36m\]$(get_lang_info) \n\[\e[0;35m\] \[\e[0;36m\]\u \[\e[0;34m\] 󱕅 \[\e[0;36mエンジニア \[\e[0;35m\] \[\e[0;31m\] \[\e[0m\]'
'';
};
}

