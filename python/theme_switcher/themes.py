import os
import subprocess

toggle_file = "/home/ranger/ranger097_nixos_dotfiles/Python/theme_switcher/toggle.txt"
wallpaper_directory = os.listdir("/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers")
num_of_wallpapers = len(wallpaper_directory)

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())
    
with open(toggle_file, 'w') as f:
    y = (x + 1) % (num_of_wallpapers + 1)
    full_file = f.write(str(y))

cat_string_file = "/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers/" + wallpaper_directory[x]
subprocess.run(["wal", "-i", cat_string_file])
subprocess.run([
"swww", "img", cat_string_file,
"--transition-type", "grow",
"--transition-step", "90",
"--transition-fps", "50"
])
subprocess.run(f"cd ~/ranger097_nixos_dotfiles && git add .",shell=True, stdout=subprocess.DEVNULL)
subprocess.run(["sudo", "nixos-rebuild", "switch", "--flake", "/home/ranger/ranger097_nixos_dotfiles/#jirachi"])
subprocess.run(["hyprctl","reload"])
subprocess.run(["pkill", "waybar"])
subprocess.Popen(["waybar", "-c", os.path.expanduser("~/.config/waybar/top.jsonc"), "-s", os.path.expanduser("~/.config/waybar/top.css")], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
subprocess.Popen(["waybar", "-c", os.path.expanduser("~/.config/waybar/bottom.jsonc"), "-s", os.path.expanduser("~/.config/waybar/bottom.css")], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
