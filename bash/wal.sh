#!/bin/bash

source "$HOME/.cache/wal/colors.sh"
(cat $HOME/.cache/wal/sequences &)
echo -e "\e]11;#000000\a"
printf "\e]10;%s\a" "$(sed -n '5p' ~/.cache/wal/colors)"
