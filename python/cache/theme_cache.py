import os
import subprocess

dotfiles_dir = "/persist/home/ranger/ranger097_nixos_dotfiles"
toggle_file = "/persist/home/ranger/ranger097_nixos_dotfiles/python/theme_switcher/toggle.txt"
wallpaper_directory = "/persist/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers"
wallpaper_list = os.listdir(wallpaper_directory)
num_of_wallpapers = len(wallpaper_list)

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())
    if x != 0:
        x = x - 1
    else:
        x = len(wallpaper_list)

cat_string_file = f"{wallpaper_directory}/{wallpaper_list[x]}"
subprocess.run([
"awww", "img", cat_string_file,
"--transition-type", "grow",
"--transition-step", "90",
"--transition-fps", "50"
])


