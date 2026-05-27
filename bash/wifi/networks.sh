#!/usr/bin/env bash
network="/persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi/networks.txt"

wifi_switch() {
while IFS=":" read -r ssid pswd; do
  [[ -z "$ssid" ]] && continue
  nmcli device wifi connect "$ssid" password "$pswd" > /dev/null 2>&1
  echo "connect to $ssid"
done < "$network"
}

wifi_switch











