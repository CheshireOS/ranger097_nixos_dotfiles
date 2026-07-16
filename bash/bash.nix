{ config, pkgs, ... }:{
programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
nii = "cd /persist/home/ranger/ranger097_nixos_dotfiles";
gii = "bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/github.sh";
hii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/home.nix";
wii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/waybar";
cii = "nvim /persist/home/.config";
pii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/python";
usii = "bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/user.sh";
exii = "cd /persist/home/ranger/Projects/Exercism/";
excii = "bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/exer.sh";
mii = "cd /persist/home/ranger/Music/";
nvii = "nvim /persist/home/ranger/ranger097_nixos_dotfiles/development/nixvim.nix";
sii = "bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/ssh.sh";
webii="bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/web.sh";
prii="cd /persist/home/ranger/Projects/";
glii="cd /persist/home/ranger/Projects/TheGlazePopStudioWeb/ && ./webserver.sh";
rii = "bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/rice.sh";
peaclock="peaclock --config-dir=/persist/home/ranger/ranger097_nixos_dotfiles/peaclock";
};
   
interactiveShellInit = ''
#!/usr/bin/env
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/development.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/system_info.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/language_info.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/update.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/git.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/wal.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/music.sh
source /persist/home/ranger/ranger097_nixos_dotfiles/bash/home.sh
export EDITOR=nvim
export VISUAL=nvim
'';

promptInit = ''
PS1='\n\[\e[0;35m\] \[\e[0;36m\]\h \[\e[0;34m\]󱕅 \[\e[0;36m ジラーチ\[\e[0;35m\]   \[\e[0;31m\] \[\e[0;36m\]$(get_dir_name)\[\e[0;36m\]$(parse_git_branch)\[\e[0;36m\]$(get_lang_info) \n\[\e[0;35m\] \[\e[0;36m\]\u \[\e[0;34m\] 󱕅 \[\e[0;36mエンジニア \[\e[0;35m\] \[\e[0;31m\] \[\e[0m\]'
'';
};
}

