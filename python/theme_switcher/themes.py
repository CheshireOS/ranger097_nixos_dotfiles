import os
import subprocess
from pathlib import Path

dotfiles_dir = Path.home() / "ranger097_nixos_dotfiles"
toggle_file = dotfiles_dir / "python/theme_switcher/toggle.txt"
wallpaper_directory = dotfiles_dir / "wallpapers/wallpapers"
wallpaper_list = os.listdir(wallpaper_directory)
num_of_wallpapers = len(wallpaper_list)

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())

with open(toggle_file, 'w') as f:
    y = (x + 1) % (num_of_wallpapers + 1)
    full_file = f.write(str(y))

cat_string_file = f"{wallpaper_directory}/{wallpaper_list[x]}"
#subprocess.run(["wal", "-i", cat_string_file])
subprocess.run([
"awww", "img", cat_string_file,
"--transition-type", "grow",
"--transition-step", "90",
"--transition-fps", "50"
])
subprocess.run(["hyprctl","reload"])
subprocess.run(["pkill", "waybar"])
subprocess.Popen(["waybar", "-c", os.path.expanduser("~/.config/waybar/top.jsonc"), "-s", os.path.expanduser("~/.config/waybar/top.css")], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
subprocess.Popen(["waybar", "-c", os.path.expanduser("~/.config/waybar/bottom.jsonc"), "-s", os.path.expanduser("~/.config/waybar/bottom.css")], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

