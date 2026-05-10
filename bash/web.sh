#!/usr/bin/env
web() {
cd /persist/home/ranger/ranger097_nixos_dotfiles/docs/
live-server --port=8080 >/dev/null 2>&1 &
xdg-open http://localhost:8080 &
nvim /persist/home/ranger/ranger097_nixos_dotfiles/docs/
}

web
