#!/bin/bash

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
echo -e "\n"
term_width=$(tput cols)
top_line="╭─────────────────────────────────╮"
top_line_len=$(echo -ne "$top_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - top_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$top_line\e[0m"

ascii_art | while read -r line; do
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

color_line="\e[31m│    \e[32m  \e[31m󰟪 \e[32m󰟪 \e[33m󰟪 \e[34m󰟪 \e[35m󰟪 \e[36m󰟪 \e[37m󰟪             \e[31m│"
color_line_len=$(echo -ne "$top_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - color_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$color_line\e[0m"

space_line="\e[31m│                                 \e[31m│"
space_line_len=$(echo -ne "$space_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - space_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$space_line\e[0m"

bottom_line="\e[31m╰─────────────────────────────────╯"
bottom_line_len=$(echo -ne "$bottom_line" | sed 's/\x1b\[[0-9;]*m//g' | wc -m)
top_pad=$(( (term_width - space_line_len) / 2 ))
printf "%''${top_pad}s%b\n" "" "\e[31m$bottom_line\e[0m"

echo -e "\n"
}

printf '\033[3 q'

