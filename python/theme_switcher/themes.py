import os
import subprocess

dotfiles_dir = "/home/ranger/ranger097_nixos_dotfiles"
toggle_file = f"{dotfiles_dir}/python/theme_switcher/toggle.txt"
wallpaper_directory = f"{dotfiles_dir}/wallpapers/wallpapers"
blur_wallpaper_directory = f"{dotfiles_dir}/wallpapers/blur"
wallpaper_list = os.listdir(wallpaper_directory)
blur_wallpaper_list = set(os.listdir(blur_wallpaper_directory))
num_of_wallpapers = len(wallpaper_list)

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())

for _ in range(num_of_wallpapers):
    x = (x + 1) % num_of_wallpapers
    if wallpaper_list[x] in blur_wallpaper_list:
        break
else:
    raise RuntimeError("wallpapers didnt match")

with open(toggle_file, "w") as f:
    f.write(str(x))

cat_string_file = f"{wallpaper_directory}/{wallpaper_list[x]}"
blur_cat_string_file = f"{blur_wallpaper_directory}/{wallpaper_list[x]}"

print(wallpaper_list[x])

subprocess.run(["wal", "-i", cat_string_file])
subprocess.run([
"awww", "img", cat_string_file,
"--transition-type", "grow",
"--transition-step", "90",
"--transition-fps", "50"
])

subprocess.run([
"awww", "img", blur_cat_string_file,
"--transition-type", "grow",
"--transition-step", "90",
"--transition-fps", "50",
"--namespace", "backdrop"
])

subprocess.run(["python3", "/home/ranger/ranger097_nixos_dotfiles/python/waybar_switcher/niri_waybar_switcher.py"])




