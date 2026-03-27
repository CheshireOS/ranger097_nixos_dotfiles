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
  "D  /home/ranger/.cache/librewolf/  0700  ranger users  0d  -"
  "D  /home/ranger/.cache/mozilla/firefox/  0700  ranger users  0d  -"
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

 "D  /var/lib/systemd/coredump/  0755  root root  0d  -"
"f+  /var/lib/mlocate/mlocate.db  0644  root root  -  -"
"f+  /var/lib/plocate/plocate.db  0644  root root  -  -"

"D  /tmp/  1777 root root  0d  -"
"D  /var/tmp/  1777 root root  0d  -"

  "f+  /var/log/wtmp  0664  root utmp  -  -"
  "f+  /var/log/btmp  0600  root utmp  -  -"
 "f+  /var/log/lastlog  0664  root utmp  -  -"


"f+  /home/ranger/.librewolf/cqtp3a7w.default/places.sqlite      0700  ranger users  -  -"
"f+  /home/ranger/.librewolf/cqtp3a7w.default/cookies.sqlite     0700  ranger users  -  -"
"f+  /home/ranger/.librewolf/cqtp3a7w.default/permissions.sqlite 0700  ranger users  -  -"
"f+  /home/ranger/.librewolf/cqtp3a7w.default/formhistory.sqlite 0700  ranger users  -  -"

"D   /home/ranger/.librewolf/cqtp3a7w.default/sessionstore-backups/  0700  ranger users  0d  -"
"D   /home/ranger/.librewolf/cqtp3a7w.default/storage/               0700  ranger users  0d  -"
];

services.fstrim.enable = true;
services.fstrim.interval = "daily";

 nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 1d";
  };


}






