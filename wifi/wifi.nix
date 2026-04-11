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
networking.nameservers = [ "9.9.9.9"];
services.resolved.enable = false;
networking.enableIPv6 = false;
networking.firewall.checkReversePath = false;
networking.nftables.enable = true;

security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-hyprland 
    ];
    config.common.default = "*";
  };

networking.firewall = {
  enable = true;
};

services.tor = {
client.transparentProxy.enable = false;
  enable = false;
  openFirewall = false;
  relay = {
    enable = false;
    role = "relay";
  };
  settings = {
    ContactInfo = "www.ghost.com";
    Nickname = "ranger";
    ORPort = 9001;
    ControlPort = 9051;
    BandWidthRate = "1 MBytes";
  };
};






}
