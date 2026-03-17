{config, pkgs, ... }: 
let 
userName = "ranger";
homeDir = config.users.users.${userName}.home;

in
{

networking.networkmanager.enable = true;
networking.networkmanager.dns = "none";
networking.useDHCP = false;
networking.dhcpcd.enable = false;
networking.nameservers = [ "9.9.9.9" "1.1.1.1"];
services.resolved.enable = false;
networking.enableIPv6 = false;
networking.firewall.checkReversePath = false;
networking.nftables.enable = true;
networking.networkmanager.ensureProfiles = {
environmentFiles = ["${homeDir}/ranger097_nixos_dotfiles/wifi.env"];
profiles = {
Home = {
connection = { 
id = "$WIFI_NM";
type = "wifi";
autoconnect = true; };
wifi = {
ssid = "$WIFI_ID";
mode = "infrastructure"; };
wifi-security = { 
key-mgmt = "wpa-psk"; 
psk = "$WIFI_PW"; };
    };
  };
};

security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    # Add the hyprland portal alongside gtk
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-hyprland 
    ];
    config.common.default = "*";
  };

systemd.user.services.riseup-vpn = {
  description = "RiseupVPN Autostart";
  wantedBy = [ "graphical-session.target" ];
  partOf = [ "graphical-session.target" ];
  serviceConfig = {
    ExecStart = "${pkgs.riseup-vpn}/bin/riseup-vpn --enable-autostart";
    Restart = "on-failure";
    RestartSec = "5";
  };
};


networking.firewall = {
  enable = true;
};

}
