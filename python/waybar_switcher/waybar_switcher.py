import os
import sys
import subprocess

toggle_file = "/home/ranger/ranger097_nixos_dotfiles/python/waybar_switcher/toggle.txt"

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())
    
try:
    if x == 0:
        subprocess.run(["waybar", "-c", "/home/ranger/ranger097_nixos_dotfiles/waybar/top.jsonc", "-s", "/home/ranger/ranger097_nixos_dotfiles/waybar/top.css"])
        subprocess.run(["waybar", "-c", "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.jsonc", "-s", "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.css"])
        with open(toggle_file, 'w') as f:
            f.write("1")
    else:
        subprocess.run(["pkill", "waybar"])
        with open(toggle_file, 'w') as f:
            f.write("0")
            
except KeyboardInterrupt:
    sys.exit(0)