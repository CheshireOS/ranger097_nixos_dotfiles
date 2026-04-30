#!/usr/bin/env
network="/persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi/networks.txt"

wifi_add() {
read -p 'Wifi SSID: ' ssid
read -p 'Wifi PSWD: ' pswd

echo "nmcli device wifi connect $ssid password $pswd" > /persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi/networks.txt
}

wifi_connect() {
sleep 2
while read line; do
$line > /dev/null 2>&1
done <$network
}

wifi_switch() {
wifi_connect
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
  echo -e "\n\e[0;37m╭───────────────────────╮\n│  \e[0;32m󱇥 \e[0;35mconnected to wifi  \e[0;37m│ \n╰───────────────────────╯\e[0;0m"
else
  wifi_add
fi
}

