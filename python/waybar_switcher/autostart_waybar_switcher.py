import os
import sys
import subprocess

toggle_file = "/home/ranger/ranger097_nixos_dotfiles/python/waybar_switcher/toggle.txt"

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())
    
try:

    if x == 0:
        subprocess.run(["pkill", "waybar"])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/niri_bottom.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/niri_bottom.css"
        ])

    else:
       subprocess.run(["pkill", "waybar"])
       subprocess.Popen(["waybar", "-c", 
       "/home/ranger/ranger097_nixos_dotfiles/waybar/niri_bottom.jsonc", "-s", 
       "/home/ranger/ranger097_nixos_dotfiles/waybar/niri_bottom.css"
       ])
       subprocess.Popen(["waybar", "-c", 
       "/home/ranger/ranger097_nixos_dotfiles/waybar/niri_top.jsonc", "-s", 
       "/home/ranger/ranger097_nixos_dotfiles/waybar/niri_top.css"
       ])

except KeyboardInterrupt:
    sys.exit(0)
