#!/bin/bash


update() {
cd ~/ranger097_nixos_dotfiles
echo " Upgrading Nixos System"
nix flake update
}
