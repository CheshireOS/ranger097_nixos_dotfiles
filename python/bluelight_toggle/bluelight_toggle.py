import subprocess

toggle_file = "/home/ranger/ranger097_nixos_dotfiles/python/bluelight_toggle/bluelight_toggle.txt"

with open(toggle_file, 'r') as f:
   x = int(f.readline().strip())

if x == 0:
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "3000"],stderr=subprocess.DEVNULL)
    with open(toggle_file, 'w') as f:
        f.write(str(1))
        print(x) 

elif x == 1:
    subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2800"])
    with open(toggle_file, 'w') as f:
        f.write(str(2))
        print(x) 

elif x == 2:
    subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2600"])
    with open(toggle_file, 'w') as f:
        f.write(str(3))
        print(x) 

elif x == 3:
    subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2500"])
    with open(toggle_file, 'w') as f:
        f.write(str(4))
        print(x) 

elif x == 4:
    subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2200"])
    with open(toggle_file, 'w') as f:
        f.write(str(5))
        print(x) 

elif x == 5:
    subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
    subprocess.Popen(["hyprsunset", "-g", "100", "-t", "2000"])
    with open(toggle_file, 'w') as f:
        f.write(str(6))
        print(x) 

elif x == 6:
    subprocess.run(["pkill", "hyprsunset"],stderr=subprocess.DEVNULL)
    with open(toggle_file, 'w') as f:
        f.write(str(0))
        print(x) 


