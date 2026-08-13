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
        "/home/ranger/ranger097_nixos_dotfiles/waybar/left.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/left.css"
        ])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.css"
        ])
        with open(toggle_file, 'w') as f:
            f.write("1")

    elif x == 1:
        subprocess.run(["pkill", "waybar"])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/right.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/right.css"
        ])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.css"
        ])
        with open(toggle_file, 'w') as f:
            f.write("2")

    elif x == 2:
        subprocess.run(["pkill", "waybar"])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/double_bottom.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/double_bottom.css"
        ])
        with open(toggle_file, 'w') as f:
            f.write("3")
    
    elif x == 3:
        subprocess.run(["pkill", "waybar"])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/music.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/music.css"
        ])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/bottom.css"
        ])
        with open(toggle_file, 'w') as f:
            f.write("4")

    elif x == 4:
        subprocess.run(["pkill", "waybar"])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/music.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/music.css"
        ])
        subprocess.Popen(["waybar", "-c", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/double_bottom.jsonc", "-s", 
        "/home/ranger/ranger097_nixos_dotfiles/waybar/double_bottom.css"
        ])
        with open(toggle_file, 'w') as f:
            f.write("5")

    else:
        subprocess.run(["pkill", "waybar"])
        with open(toggle_file, 'w') as f:
            f.write("0")

except KeyboardInterrupt:
    sys.exit(0)
