{ config, lib, ... }: {

  environment.persistence."/persist" = {
    hideMounts = true;
    
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
      "/etc/ssh"
    ];
    
    files = [
      "/etc/machine-id"
      "/etc/shadow"
    ];

    users.ranger = {
      directories = [
        "Music"
	"Projects"
        "ranger097_nixos_dotfiles"
        ".local/share/direnv"
	".config/direnv"
        ".ssh"      
	".cache/wal"
	".cache/awww"
	".config/wal"
	".config/gh"
      ];
      files = [
      ];
    };
  };


}
