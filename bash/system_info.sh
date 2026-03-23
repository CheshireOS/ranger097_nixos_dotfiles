#!/bin/bash

function Music_fetch {
song_playing=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)
if [ "$song_playing" != "No players found" ] && [ -n "$song_playing" ]; then
   fmt_song=$(printf "%-32.32s" "$song_playing")
   echo -e "    \e[32m  \e[36m$fmt_song"
else
   fmt_song=$(printf "%-32.32s" "No music playing")
   echo -e "    \e[32m  \e[36m$fmt_song"
fi
}

host_name=$(hostnamectl | awk 'NR==1 {print $3}')
function Host_fetch {
fmt_host=$(printf "%-32.32s" "Host $host_name")
if [ $? -eq 0 ]; then
   echo -e "    \e[32m󰐝  \e[36m$fmt_host"
else
   echo -e "    \e[32m󰐝  \e[36mWTF$fmt_host"
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
fmt_name=$(printf "%-32.32s" "$repo_name")
fmt_update=$(printf "%-32.32s" "Last push $update_time")
fmt_forks=$(printf "%-32.32s" "Forks $forks_count")
fmt_stars=$(printf "%-32.32s" "Stars $stars_count")
echo -e "\e[32m  \e[36m$fmt_name    "
echo -e "\e[32m  \e[36m$fmt_stars    "
echo -e "\e[32m  \e[36m$fmt_forks    "
echo -e "\e[32m  \e[36m$fmt_update    "
echo -e "                                       "
}






ranger_fetch() {
echo -e "\n\n"
term_width=$(tput cols)
top_line=""
top_line_len=$(echo -ne "$top_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - top_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$top_line\e[0m"

ascii_art | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

github_info | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

Music_fetch | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

Host_fetch | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

kernel_fetch | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

OS_fetch | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

IP_fetch | while read -r line; do
line_len=$(echo -ne "$line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
line_pad=$(( (term_width - line_len) / 2 ))
printf "%''${line_pad}s%b\n" "" "$line"
done

color_line="    \e[32m  \e[31m󰟪 \e[32m󰟪 \e[33m󰟪 \e[34m󰟪 \e[35m󰟪 \e[36m󰟪 \e[37m󰟪                   "
color_line_len=$(echo -ne "$top_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - color_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$color_line\e[0m"

space_line="                                       "
space_line_len=$(echo -ne "$space_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - space_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$space_line\e[0m"

bottom_line=""
bottom_line_len=$(echo -ne "$bottom_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - space_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$bottom_line\e[0m"
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




