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
ls = "lsd --tree --icon=always --depth 1";
lsa = "lsd -a --tree --icon=always --depth 1";
clear = "clear && ranger_fetch";
ytd = "yt-dlp -x --audio-format mp3 --audio-quality 0 --cookies-from-browser firefox --embed-metadata --embed-thumbnail --add-metadata";
nvii = "nvim ~/ranger097_nixos_dotfiles/development/nixvim.nix";
anime = "ani-cli --dub";
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


#printf "\e]10;%s\a" "$(sed -n '5p' ~/.cache/wal/colors)"
#echo -e "\e]11;#000000\a"
'';

promptInit = ''
PS1="\n\[\e[31m\]╭───\[\e[36m\]\$(get_dir_name)\$(parse_git_branch)\[\e[32m\]\$(get_lang_info)\[\e[35m\]\n\[\e[31m\]╰─\[\e[36m\]〉\[\e[0m\]"
'';
};
}

