#!/bin/bash

width=$(tput cols)
math=$(( width /  2 ))
percent=$( echo "math * 0.05" | bc -l )
padding=$( echo "math - percent" | bc -l )
padding=$(printf "%.0f" "$padding")

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
host_name=$(hostnamectl | awk 'NR==1 {print $3}')
fmt_host=$(printf "%-32.32s" "Host $host_name")
if [ $? -eq 0 ]; then
  printf "%*s\e[32m󰐝  \e[36m%s\e[0m\n" "$padding" "" "$fmt_host" 
else
  printf "%*s\e[32m󰐝  \e[36m%s\e[0m\n" "$padding" "" "WTF???" 
fi
}

Operating_system=$(hostnamectl | awk 'NR==6 {print $3, $4, $5 }')
function OS_fetch {
fmt_os=$(printf "%-32.32s" "$Operating_system")
if [ $? -eq 0 ]; then
   echo -e "    \e[32m  \e[36m$fmt_os"
else
   echo -e "    \e[32m  \e[36mWTF$fmt_os"
fi
}

Kernel_version=$(hostnamectl | awk 'NR==8 {print $2, $3}')
function kernel_fetch {
fmt_kernel=$(printf "%-32.32s" "$Kernel_version")
if [ $? -eq 0 ]; then
   echo -e "    \e[32m  \e[36m$fmt_kernel"
else
   echo -e "    \e[32m  \e[36mBro really$fmt_kernel"
fi
}

IP_address=$(curl icanhazip.com 2> /dev/null )
function IP_fetch {
fmt_ip=$(printf "%-32.32s" "$IP_address")
if [ $? -eq 0 ]; then
   echo -e "    \e[32m󰖩  \e[36m$fmt_ip"
else
   echo -e "    \e[32m󰖩  \e[36mNO IP ADDRESS$fmt_ip"
fi
}

top_ascii="┏┓╻   ╻   ╻ ╻   ┏━┓   ┏━┓"
mid_ascii="┃┗┫   ┃   ┏╋┛   ┃ ┃   ┗━┓"
bot_ascii="╹ ╹   ╹   ╹ ╹   ┗━┛   ┗━┛"
function ascii_art {
echo -e "                                       "
echo -e "       \e[32m$top_ascii       "
echo -e "       \e[32m$mid_ascii       "
echo -e "       \e[32m$bot_ascii       "
echo -e "                                       "
}

function github_info {
repo_name="ranger097"
update_time=$(gh repo view ranger097_nixos_dotfiles --json updatedAt --template '{{.updatedAt | timeago}}')
forks_count=$(gh repo view ranger097_nixos_dotfiles --json forkCount --jq '.forkCount')
stars_count=$(gh repo view ranger097_nixos_dotfiles --json stargazerCount --jq '.stargazerCount')
fmt_name=$(printf "%32s" "\e[32m \e[36m$repo_name")
fmt_update=$(printf "%32s" "\e[32m \e[36m$Last push $update_time")
fmt_forks=$(printf "%32s" "\e[32m  \e[36m$Forks $forks_count")
fmt_stars=$(printf "%32s" "\e[32m \e[36m$Stars $stars_count")
echo -e "$fmt_name"
echo -e "$fmt_stars"
echo -e "$fmt_forks"
echo -e "$fmt_update"
echo -e "                                       "
}


color_line="\e[32m  \e[31m󰟪 \e[32m󰟪 \e[33m󰟪 \e[34m󰟪 \e[35m󰟪 \e[36m󰟪 \e[37m󰟪 "
color_line_len=$(echo -ne "$top_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
printf "%*s%s\n" ${top_pad} "" "$color_line\e[0m"

ranger_fetch() {
echo -e "\n"
ascii_art
github_info
Music_fetch
Host_fetch
kernel_fetch
OS_fetch
IP_fetch





}

printf '\033[3 q'

echo -e "\e]11;#000000\a"
function ranger_page() {
    tput civis
    ranger_fetch
    echo -e "\e]11;#000000\a"
    read -s -n 1 -p ""
    clear
    pokeget random --hide-name
    tput cnorm
}

if [[ $(tput lines) -ge 25 && $(tput cols) -ge 60 ]]; then
   ranger_page

else [[ $(tput lines) -ge 12 && $(tput cols) -ge 48 ]];
   pokeget --mega random --hide-name
    echo -e "\e]11;#000000\a"
   read -s -n 1 -p ""
   clear
fi




