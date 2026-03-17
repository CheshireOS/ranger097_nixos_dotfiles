{ config, pkgs, ... }:{

programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
nii = "cd ~/ranger097_nixos_dotfiles";
bii = "sudo nano ~/ranger097_nixos_dotfiles/bash.nix";
gii = "sudo nano ~/ranger097_nixos_dotfiles/ghostty/config";
hii = "sudo nano ~/ranger097_nixos_dotfiles/home.nix";
wii = "cd ~/ranger097_nixos_dotfiles/waybar";
cii = "cd ~/.config";
ls = "lsd -a";
ytdownload = "yt-dlp -x --audio-format mp3 --audio-quality 0 --cookies-from-browser firefox --embed-metadata --embed-thumbnail --add-metadata";
};
   
interactiveShellInit = ''
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
sudo nixos-rebuild switch --flake .#deoxy
wait
echo " Updated dotfiles and system flake."
}

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
sudo nixos-rebuild switch --flake .#jirachi
wait
echo " Updated dotfiles and system flake."
}

update() {
cd ~/ranger097_nixos_dotfiles
echo " Upgrading Nixos System"
nix flake update
}

#export XDG_CONFIG_HOME="$HOME/.cache"
source "$HOME/.cache/wal/colors.sh"
(cat $HOME/.cache/wal/sequences &)
#pokeget random --hide-name
eval "$(direnv hook bash)"


  get_lang_info() {
      if ls *.go >/dev/null 2>&1 && command -v go >/dev/null 2>&1; then
        echo "  v$(go version | awk '{print $3}' | sed 's/go//')"
      elif ls *.py >/dev/null 2>&1 && command -v python >/dev/null 2>&1; then
        echo "  v$(python --version | awk '{print $2}')"
      elif ls *.rs >/dev/null 2>&1 && command -v rustc >/dev/null 2>&1; then
        echo "  v$(rustc --version | awk '{print $2}')"
      elif ls *.ts >/dev/null 2>&1 && command -v tsc >/dev/null 2>&1; then
        echo "  v$(tsc -v | awk '{print $2}')"
      elif { ls *.js >/dev/null 2>&1 || [[ -f package.json ]]; } && command -v node >/dev/null 2>&1; then
        echo "   v$(node -v | sed 's/v//')"
      elif ls *.rb >/dev/null 2>&1 && command -v ruby >/dev/null 2>&1; then
        echo "  v$(ruby -v | awk '{print $2}')"
      elif ls *.php >/dev/null 2>&1 && command -v php >/dev/null 2>&1; then
        echo "    v$(php -v | head -n 1 | awk '{print $2}')"
      elif ls *.ex* >/dev/null 2>&1 && command -v elixir >/dev/null 2>&1; then
        echo "  v$(elixir -v | grep Elixir | awk '{print $2}')"
      elif { ls *.clj >/dev/null 2>&1 || [[ -f deps.edn ]]; } && command -v clojure >/dev/null 2>&1; then
        echo "  v$(clojure --version 2>&1 | awk '{print $3}')"
      elif ls *.kt >/dev/null 2>&1 && command -v kotlinc >/dev/null 2>&1; then
        echo "  v$(kotlinc -version 2>&1 | awk '{print $3}' | cut -d'-' -f1)"
      elif ls *.java >/dev/null 2>&1 && command -v java >/dev/null 2>&1; then
        echo "  v$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')"
      elif ls *.sh >/dev/null 2>&1; then
        echo "   v''${BASH_VERSION%%(*}"
      elif ls *.cpp >/dev/null 2>&1 || ls *.hpp >/dev/null 2>&1; then
        echo "  C++"
      elif ls *.c >/dev/null 2>&1 && command -v gcc >/dev/null 2>&1; then
        echo "  v$(gcc -dumpversion)"
      elif ls *.hs >/dev/null 2>&1 && command -v ghc >/dev/null 2>&1; then
        echo "  v$(ghc --version | awk '{print $8}')"
      elif ls *.scala >/dev/null 2>&1 && command -v scala >/dev/null 2>&1; then
        echo "  v$(scala -version 2>&1 | awk '{print $4}')"
      elif ls *.ml >/dev/null 2>&1 && command -v ocaml >/dev/null 2>&1; then
        echo "  v$(ocaml -vnum)"
      elif ls *.dart >/dev/null 2>&1 && command -v dart >/dev/null 2>&1; then
        echo "  v$(dart --version | awk '{print $4}')"
      elif ls *.zig >/dev/null 2>&1 && command -v zig >/dev/null 2>&1; then
        echo "  v$(zig version)"
      elif ls *.cs >/dev/null 2>&1 && command -v dotnet >/dev/null 2>&1; then
        echo "    v$(dotnet --version | head -n 1)"
      elif ls *.lua >/dev/null 2>&1 && command -v lua >/dev/null 2>&1; then
        echo "  v$(lua -v | awk '{print $2}')"
      elif ls *.r >/dev/null 2>&1 && command -v R >/dev/null 2>&1; then
        echo "    v$(R --version | head -n 1 | awk '{print $3}')"
      elif ls *.jl >/dev/null 2>&1 && command -v julia >/dev/null 2>&1; then
        echo "  v$(julia --version | awk '{print $3}')"
      elif ls *.nim >/dev/null 2>&1 && command -v nim >/dev/null 2>&1; then
        echo "  v$(nim --version | head -n 1 | awk '{print $4}')"
      elif ls *.cr >/dev/null 2>&1 && command -v crystal >/dev/null 2>&1; then
        echo "  v$(crystal --version | head -n 1 | awk '{print $2}')"
      elif ls *.v >/dev/null 2>&1 && command -v v >/dev/null 2>&1; then
        echo "  v$(v version | awk '{print $2}')"
      elif ls *.swift >/dev/null 2>&1 && command -v swift >/dev/null 2>&1; then
        echo "  v$(swift --version | head -n 1 | awk '{print $4}')"
      elif ls *.nix >/dev/null 2>&1; then
        echo "  nix v$(nix --version | awk '{print $3}')"
      elif [[ -f Dockerfile ]]; then
        echo "   docker"
      elif ls *.md >/dev/null 2>&1; then
        echo " \[\e[0m\] md"
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
    echo " on $branch  branch"
  fi
}

song_playing=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)
function Music_fetch {
fmt_song=$(printf "%-26.26s" "$song_playing")
if [ $? -eq 0 ]; then
   echo -e "\e[31m│    \e[32m  \e[36m$fmt_song\e[31m│"
else
   echo -e "\e[31m│    \e[32m  \e[36mNo Music Playing.$fmt_song\e[31m│"
fi
}

host_name=$(hostnamectl | awk 'NR==1 {print $3}')
function Host_fetch {
fmt_host=$(printf "%-26.26s" "$host_name")
if [ $? -eq 0 ]; then
   echo -e "\e[31m│    \e[32m󰐝  \e[36m$fmt_host\e[31m│"
else
   echo -e "\e[31m│    \e[32m󰐝  \e[36mHow the fuck you dont have a host name$fmt_host\e[31m│"
fi
}

Operating_system=$(hostnamectl | awk 'NR==6 {print $3, $4, $5 }')
function OS_fetch {
fmt_os=$(printf "%-26.26s" "$Operating_system")
if [ $? -eq 0 ]; then
   echo -e "\e[31m│    \e[32m  \e[36m$fmt_os\e[31m│"
else
   echo -e "\e[31m│    \e[32m  \e[36mHow the fuck do you not have an operating system$fmt_os\e[31m│"
fi
}

Kernel_version=$(hostnamectl | awk 'NR==8 {print $2, $3}')
function kernel_fetch {
fmt_kernel=$(printf "%-26.26s" "$Kernel_version")
if [ $? -eq 0 ]; then
   echo -e "\e[31m│    \e[32m  \e[36m$fmt_kernel\e[31m│"
else
   echo -e "\e[31m│    \e[32m  \e[36mBro really$fmt_kernel\e[31m│"
fi
}

IP_address=$(curl icanhazip.com 2> /dev/null )
function IP_fetch {
fmt_ip=$(printf "%-26.26s" "$IP_address")
if [ $? -eq 0 ]; then
   echo -e "\e[31m│    \e[32m󰖩  \e[36m$fmt_ip\e[31m│"
else
   echo -e "\e[31m│    \e[32m󰖩  \e[36mNO IP ADDRESS$fmt_ip\e[31m│"
fi
}

top_ascii="┏┓╻   ╻   ╻ ╻   ┏━┓   ┏━┓"
mid_ascii="┃┗┫   ┃   ┏╋┛   ┃ ┃   ┗━┓"
bot_ascii="╹ ╹   ╹   ╹ ╹   ┗━┛   ┗━┛"
function ascii_art {
echo -e "\e[31m│                                 \e[31m│"
echo -e "\e[31m│    \e[32m$top_ascii    \e[31m│"
echo -e "\e[31m│    \e[32m$mid_ascii    \e[31m│"
echo -e "\e[31m│    \e[32m$bot_ascii    \e[31m│"
echo -e "\e[31m│                                 \e[31m│"
}




ranger_fetch() {
echo -e "\e[31m╭─────────────────────────────────╮"
ascii_art
Music_fetch 
Host_fetch 
kernel_fetch 
OS_fetch 
IP_fetch 
echo -e "\e[31m│     \e[32m                           \e[31m│"
echo -e "\e[31m│                                 \e[31m│"
echo -e "\e[31m╰─────────────────────────────────╯"
}

ranger_fetch
'';

promptInit = ''
PS1="\n\[\e[31m\]╭──\[\e[36m\]\$(get_dir_name)\$(parse_git_branch)\[\e[32m\]\$(get_lang_info)\[\e[35m\]\n\[\e[31m\]╰─\[\e[36m\]〉\[\e[0m\]"
'';

};
}

