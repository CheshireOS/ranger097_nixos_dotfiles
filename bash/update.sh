#!/bin/bash


update() {
cd ~/ranger097_nixos_dotfiles
echo " Upgrading Nixos System"
jgit
nix flake update
jgit
}
