{ config, lib, ... }: {

  environment.persistence."/persistent" = {
    hideMounts = true;
    
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
    ];
    
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/shadow"
    ];

    users.ranger = {
      directories = [
        "Music" 
        "ranger097_nixos_dotfiles"
        ".local/share/direnv"
        ".ssh"      
	".cache/wal"
	".cache/awww"
	".config/wal"
      ];
      files = [
      ];
    };
  };


boot.initrd.postDeviceCommands = lib.mkAfter ''
  mkdir /mnt
  mount -t btrfs /dev/mapper/crypt_root1 /mnt

  if [ -e /mnt/root ]; then
    btrfs subvolume delete /mnt/root
  fi
  btrfs subvolume snapshot /mnt/root-blank /mnt/root
  
  umount /mnt
'';
}
