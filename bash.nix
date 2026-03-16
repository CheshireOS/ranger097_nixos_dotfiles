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
pokeget random --hide-name
eval "$(direnv hook bash)"


get_lang_info() {
  if ls *.go >/dev/null 2>&1 && command -v go >/dev/null 2>&1; then
    echo " \[\e[32m\] v$(go version | awk '{print $3}' | sed 's/go//')"
  
  elif ls *.py >/dev/null 2>&1 && command -v python >/dev/null 2>&1; then
    echo " \[\e[34m\] v$(python --version | awk '{print $2}')"

  elif ls *.rs >/dev/null 2>&1 && command -v rustc >/dev/null 2>&1; then
    echo " \[\e[31m\] v$(rustc --version | awk '{print $2}')"

  elif ls *.ts >/dev/null 2>&1 && command -v tsc >/dev/null 2>&1; then
    echo " \[\e[34m\] v$(tsc -v | awk '{print $2}')"

  elif { ls *.js >/dev/null 2>&1 || [[ -f package.json ]]; } && command -v node >/dev/null 2>&1; then
    echo " \[\e[33m\]   v$(node -v | sed 's/v//')"

  elif ls *.ex* >/dev/null 2>&1 && command -v elixir >/dev/null 2>&1; then
    echo " \[\e[35m\] v$(elixir -v | grep Elixir | awk '{print $2}')"

  elif { ls *.clj >/dev/null 2>&1 || [[ -f deps.edn ]]; } && command -v clojure >/dev/null 2>&1; then
    echo " \[\e[36m\] v$(clojure --version 2>&1 | awk '{print $3}')"

  elif ls *.kt >/dev/null 2>&1 && command -v kotlinc >/dev/null 2>&1; then
    echo " \[\e[35m\] v$(kotlinc -version 2>&1 | awk '{print $3}' | cut -d'-' -f1)"

  elif ls *.java >/dev/null 2>&1 && command -v java >/dev/null 2>&1; then
    echo " \[\e[31m\] v$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')"

  elif ls *.sh >/dev/null 2>&1; then
    echo " \[\e[32m\]   v${BASH_VERSION%%(*}"

  elif ls *.cpp >/dev/null 2>&1 || ls *.hpp >/dev/null 2>&1; then
    echo " \[\e[34m\] C++"

  elif ls *.c >/dev/null 2>&1 && command -v gcc >/dev/null 2>&1; then
    echo " \[\e[36m\] v$(gcc -dumpversion)"

  elif ls *.hs >/dev/null 2>&1 && command -v ghc >/dev/null 2>&1; then
    echo " \[\e[35m\] v$(ghc --version | awk '{print $8}')"

  elif ls *.scala >/dev/null 2>&1 && command -v scala >/dev/null 2>&1; then
    echo " \[\e[31m\] v$(scala -version 2>&1 | awk '{print $4}')"

  elif ls *.ml >/dev/null 2>&1 && command -v ocaml >/dev/null 2>&1; then
    echo " \[\e[33m\] v$(ocaml -vnum)"

  elif ls *.dart >/dev/null 2>&1 && command -v dart >/dev/null 2>&1; then
    echo " \[\e[36m\] v$(dart --version 2>&1 | awk '{print $4}')"

  elif ls *.zig >/dev/null 2>&1 && command -v zig >/dev/null 2>&1; then
    echo " \[\e[33m\] v$(zig version)"

  elif ls *.nix >/dev/null 2>&1; then
    echo " \[\e[34m\] nix"

  elif [[ -f Dockerfile ]]; then
    echo " \[\e[34m\]   docker"

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
    echo " on $branch"
  fi
}

'';

promptInit = ''
PS1="\n\[\e[31m\]╭──\[\e[36m\]\$(get_dir_name)\$(parse_git_branch)\[\e[32m\]\$(get_lang_info)\[\e[35m\]\n\[\e[31m\]╰─\[\e[36m\]〉\[\e[0m\]"
'';

};
}
