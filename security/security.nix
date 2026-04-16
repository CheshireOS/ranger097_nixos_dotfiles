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


  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = lib.mkForce true;
  boot.loader.efi.canTouchEfiVariables = true;

services.logind.settings.Login = {
  HandleLidSwitch = "poweroff";
  HandleLidSwitchExternalPower = "poweroff";
  HandleLidSwitchDocked = "poweroff";
  LidSwitchIgnoreInhibited = "yes";
 };

boot.initrd.luks.devices = {
    "cryptroot1" = {
      device = "/dev/disk/by-uuid/e600efd4-8a5c-4afe-bf3b-f67e5efa1eaf";
      allowDiscards = true;
    };
    "cryptroot2" = {
      device = "/dev/disk/by-uuid/8f5e8d13-49fc-4885-94e4-9866ac549f88";
      allowDiscards = true;
    };
  };

  boot.initrd.supportedFilesystems = [ "btrfs" ];

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=4G" "mode=755" ];
  };  


fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4C79-9D1A";
    fsType = "vfat";
  };



fileSystems."/nix" = {
 options = [ "subvol=@nix" "compress=zstd" "noatime" ];
 device = "/dev/mapper/cryptroot1";
 fsType = "btrfs";
};


fileSystems."/persist" = {
    device = "/dev/mapper/cryptroot1";
    fsType = "btrfs";
    options = [ "subvol=@persist" "compress=zstd" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/mapper/cryptroot1";
    fsType = "btrfs";
    options = [ "subvol=@log" "compress=zstd" ];
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
];

services.fstrim.enable = true;
services.fstrim.interval = "daily";

 nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 1d";
  };

boot.tmp.tmpfsSize = "32G";
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






