{ config, pkgs, lib, ... }:{

security.sudo.wheelNeedsPassword = false; 
security.protectKernelImage = true;
boot.kernelParams = [ 
  "nvidia_drm.modeset=1" 
  "nvidia_drm.fbdev=1" 
  "init_on_free=1"
  "page_poison=1"
  "slub_debug=P"
  "page_alloc.shuffle=1"
  "slab_nomerge"
  "apparmor=1" 
  ];

services.logind.settings.Login = {
  HandleLidSwitch = "poweroff";
  HandleLidSwitchExternalPower = "poweroff";
  HandleLidSwitchDocked = "poweroff";
  LidSwitchIgnoreInhibited = "yes";
 };

boot.tmp.useTmpfs = true;
boot.tmp.cleanOnBoot = true;
boot.kernel.sysctl = {
"kernel.dmesg_restrict" = 1;
"kernel.kptr_restrict" = 2;
"Kernel.unprivileged_userns_clone" = 0; 
"net.core.bpf_jit_harden" = 2;
"kernel.yama.ptrace_scope" = 2;
};

networking.networkmanager.wifi.scanRandMacAddress = true;
services.openssh = {
   enable = false;
};

systemd.tmpfiles.rules = [
  "D  /home/ranger/Downloads  0700  ranger users  0d  -"
  "D  /home/ranger/Documents  0700  ranger users  0d  -"
  "D  /home/ranger/Pictures   0700  ranger users  0d  -"
  "D  /home/ranger/Videos     0700  ranger users  0d  -"
  "D  /home/ranger/.cache/thumbnails/  0700  ranger users  0d  -"
  "D /home/ranger/.cache/nvidia/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/nix/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/awww/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/elephant/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/fontconfig/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/kwin/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/yt-dlp/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/nvim/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/mpv/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/gtk-4.0/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/mesa_shader_cache/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/qmmp/ 0700 ranger users 0d -"
  "D /home/ranger/.cache/zig/ 0700 ranger users 0d -"

  "D  /home/ranger/.local/share/Trash/      0700 ranger users 0d -"

  "f+  /home/ranger/.bash_history  0600  ranger users  -  -"
  "f+  /home/ranger/.viminfo  0600  ranger users  -  -"
  "f+  /home/ranger/.nano_history  0600  ranger users  -  -"
  "f+  /home/ranger/.lesshst  0600  ranger users  -  -"
  "f+  /home/ranger/.mysql_history  0600  ranger users  -  -"
  "f+  /home/ranger/.psql_history  0600  ranger users  -  -"
  "f+  /home/ranger/.local/share/RecentlyUsed.xbel  0600  ranger users  -  -"
  "f+  /home/ranger/.ssh/known_hosts  0644  ranger users  -  -"
  "f+  /home/ranger/.ssh/known_hosts.old  0644  ranger users  -  -"

  "e  /var/log/journal/  0755  root root  0d -"
  "e  /run/log/journal/  0755  root root  0d -"
  "f+  /var/log/auth.log  0600  root root  -  -"
  "f+  /var/log/secure  0600  root root  -  -"
  "f+  /var/log/syslog  0600  root root  -  -"
  "f+  /var/log/messages  0644  root root  -  -"
  "f+  /var/log/audit/audit.log  0600  root root  -  -"

  "e  /var/log/samba/  0750  root root  0d  -"
  "e  /var/log/apache2/  0750  root root  0d  -"
  "e  /var/log/nginx/  0750  root root  0d  -"

  "f+  /var/lib/NetworkManager/seen-bssids  0600  root root  -  -"

  "f+  /var/lib/mlocate/mlocate.db  0644  root root  -  -"
  "f+  /var/lib/plocate/plocate.db  0644  root root  -  -"
  "f+  /var/log/lastlog  0664  root utmp  -  -"

  "f+  /home/ranger/.librewolf/cqtp3a7w.default/places.sqlite      0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/cookies.sqlite     0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/formhistory.sqlite 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/content-prefs.sqlite 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/cookies.sqlite-wal 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/cookies.sqlite.bak 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/favicons.sqlite 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/favicons.sqlite-wal 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/places.sqlite-wal 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/places.sqlite.corrupt 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/webappsstore.sqlite 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/webappsstore.sqlite-wal 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/storage-sync-v2.sqlite 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/storage-sync-v2.sqlite-shm 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/storage-sync-v2.sqlite-wal 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/storage.sqlite 0600  ranger users  -  -"
  "D  /home/ranger/.librewolf/cqtp3a7w.default/sessionstore-logs/ 0600  ranger users  -  -"
  "D  /home/ranger/.librewolf/cqtp3a7w.default/sessionstore-backups 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/logins.db 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/key4.db 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/content-prefs.sqlite 0600  ranger users  -  -"
  "f+  /home/ranger/.librewolf/cqtp3a7w.default/logins.json  0600  ranger users  -  -"
  "D  /home/ranger/.librewolf/cqtp3a7w.default/storage/ 0600 ranger users - -"

  "D  /home/ranger/.librewolf/cqtp3a7w.default/cache2/  0700  ranger users  0d  -"
  "D  /home/ranger/.local/share/librewolf/  0700  ranger users  0d  -"

  "f+  /home/ranger/.zsh_history  0600  ranger users  -  -"
  "f+  /home/ranger/.python_history  0600  ranger users  -  -"
  "f+  /home/ranger/.node_repl_history  0600  ranger users  -  -"
  "f+  /home/ranger/.wget-hsts  0600  ranger users  -  -"

  "D  /var/cache/systemd-resolved/  0755  root root  0d  -"

];

services.fstrim.enable = true;
services.fstrim.interval = "daily";

 nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 1d";
  };


boot.tmp.tmpfsSize = "20G";
systemd.coredump.enable = true;
systemd.timers."systemd-tmpfiles-clean".timerConfig = {
  OnUnitActiveSec = "1h";
  OnBootSec = "1h";
};

services.usbguard = {
  enable = true;
  dbus.enable = true;
  implicitPolicyTarget = "allow"; #switch to "block" or "allow"
  
  rules = ''
    #this is my bluetooth card
    #if you need to add a bluetooth card
    #run lsusb and enable it here
    allow id 8087:0033 name "Intel Bluetooth"
  '';
};

security.apparmor = {
enable = true;
packages = with pkgs; [ 
   apparmor-profiles 
 ];
};

}






