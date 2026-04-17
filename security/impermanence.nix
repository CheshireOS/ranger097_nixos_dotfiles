{ config, lib, ... }: {

  environment.persistence."/persist" = {
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
	".config/direnv"
        ".ssh"      
	".cache/wal"
	".cache/awww"
	".config/wal"
      ];
      files = [
      ];
    };
  };


}
