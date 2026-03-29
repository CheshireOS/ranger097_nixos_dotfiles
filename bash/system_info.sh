#!/bin/bash

width=$(tput cols)
math=$(( width /  2 ))
percent=$(( width / 6 ))
padding=$(( math - percent ))

function pokemon() {
poke=$(pokeget --mega random --hide-name)
printf "%*s" "$padding" "$poke"
} 

function Music_fetch {
local song_playing=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)
local status=$(playerctl status 2>/dev/null)
if [ "$song_playing" != "No players found" ] && [ -n "$song_playing" ]; then
    printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "$song_playing"
else
    printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "No music playing"
fi
}

function Host_fetch {
local host_name=$(hostnamectl | awk 'NR==1 {print $3}')
if [ $? -eq 0 ]; then
     printf "%*s\e[32m󰐝  \e[36m%s\e[0m\n" "$padding" "" "$host_name" 
else
     printf "%*s\e[32m󰐝  \e[36m%s\e[0m\n" "$padding" "" "wtf???" 
fi
}

function OS_fetch {
local operating_system=$(hostnamectl | awk 'NR==6 {print $3, $4, $5 }')
if [ $? -eq 0 ]; then
    printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "$operating_system" 
else
    printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "wtf???" 
fi
}

function kernel_fetch {
local kernel_version=$(hostnamectl | awk 'NR==8 {print $2, $3}')
if [ $? -eq 0 ]; then
   printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "$kernel_version" 
else
   printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "wtf???"
fi
}

function IP_fetch {
if systemctl is-active --quiet tor; then
   printf "%*s\e[32m󱚿  \e[36m%s\e[0m\n" "$padding" "" "Encrypted" 
else
   printf "%*s\e[32m󱛀  \e[36m%s\e[0m\n" "$padding" "" "Unencrypted" 
fi
}

function ascii_art {
local top_ascii="┏┓╻   ╻   ╻ ╻   ┏━┓   ┏━┓"
local mid_ascii="┃┗┫   ┃   ┏╋┛   ┃ ┃   ┗━┓"
local bot_ascii="╹ ╹   ╹   ╹ ╹   ┗━┛   ┗━┛"
echo -e "\n"
printf "%*s\e[32m%s\e[0m\n" "$padding" "" "$top_ascii" 
printf "%*s\e[32m%s\e[0m\n" "$padding" "" "$mid_ascii" 
printf "%*s\e[32m%s\e[0m\n" "$padding" "" "$bot_ascii" 
}

function github_info {
local repo_name="ranger097"
local update_time=$(gh repo view ranger097_nixos_dotfiles --json updatedAt --template '{{.updatedAt | timeago}}')
local forks_count=$(gh repo view ranger097_nixos_dotfiles --json forkCount --jq '.forkCount')
local stars_count=$(gh repo view ranger097_nixos_dotfiles --json stargazerCount --jq '.stargazerCount')
printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "$repo_name" 
printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "Stars $stars_count" 
printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "Forks $forks_count" 
printf "%*s\e[32m  \e[36m%s\e[0m\n" "$padding" "" "Updated $update_time"
}

colors() {
local color_line=$'\e[32m󰮯  \e[31m󰊠 \e[32m󰊠 \e[33m󰊠 \e[34m󰊠 \e[35m󰊠 \e[36m󰊠 \e[37m󰊠'
printf "%*s%s\e[0m\n" "$padding" "" "$color_line" 
}


ranger_fetch() {
echo -e "\n"
ascii_art
github_info
Music_fetch
Host_fetch
kernel_fetch
OS_fetch
IP_fetch
colors
}

#printf '\033[3 q'
#echo -e "\e]11;#000000\a"

function ranger_page() {
    tput civis
    ranger_fetch
    read -s -n 1 -p ""
    clear
    tput cnorm
}

love_tmux() {
if [ -z "$TMUX" ]; then
   if tmux has-session -t ranger 2>/dev/null && tmux has-session -t terminal 2>/dev/null; then
      tmux attach-session -t terminal
elif tmux has-session -t ranger 2>/dev/null; then
      tmux new-session -s terminal 2>/dev/null
else
      tmux new-session -s ranger 2>/dev/null
   fi
fi

if [[ $(tput lines) -ge 15 && $(tput cols) -ge 60 ]]; then
   ranger_page

else [[ $(tput lines) -le 14 && $(tput cols) -le 59 ]];
   pokemon
   read -s -n 1 -p ""
   clear
fi
}

love_tmux
