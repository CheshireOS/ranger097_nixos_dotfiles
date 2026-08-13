import subprocess

toggle_file = "/home/ranger/ranger097_nixos_dotfiles/python/bluelight_toggle/bluelight_toggle.txt"

try:
    with open(toggle_file, 'r') as f:
        x = int(f.readline().strip())

    if x == 0:
        subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2700"])
        with open(toggle_file, 'w') as f:
            f.write(str(1))
            print(x) 

    elif x == 1:
        subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
        with open(toggle_file, 'w') as f:
            f.write(str(2))
            print(x) 

    elif x == 2:
        subprocess.Popen(["hyprsunset", "-g", "90", "-t", "2200"])
        with open(toggle_file, 'w') as f:
            f.write(str(3))
            print(x) 

    elif x == 3:
        subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
        with open(toggle_file, 'w') as f:
            f.write(str(0))
            print(x) 

except FileNotFoundError: 
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2800"])
    print("Applying default hyprsunset settings, toggle_file wasnt found.")

except PermissionError:
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2800"])
    print("Applying default hyprsunset settings, your user doesnt have permission to edit the toggle_file somehow???")

except ModuleNotFoundError:
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2800"])
    print("Applying default hyprsunset settings, you are missing dependencies.")

