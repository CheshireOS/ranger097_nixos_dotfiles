{ config, pkgs, ... }:{
nixpkgs.config.allowUnfree = true;
programs.steam.enable = true;
programs.direnv = {
enable = true;
nix-direnv.enable = true;
};
programs.direnv.silent = true;
nixpkgs.config.android_sdk.accept_license = true;
environment.systemPackages = with pkgs; [
sbctl
ani-cli
steam
blueman
kdePackages.dolphin
kdePackages.kdenlive
kdePackages.qtstyleplugin-kvantum
waybar
swww
walker
networkmanager
networkmanagerapplet
home-manager
libsForQt5.qt5ct
libsForQt5.qtstyleplugin-kvantum
kdePackages.kio-extras
kdePackages.qt6ct
brightnessctl
vesktop
libreoffice-fresh
wlogout
playerctl
pavucontrol
bluez
gimp
kdePackages.qtsvg
kdePackages.ffmpegthumbs
usbutils
yt-dlp
qmmp
mpvpaper
mpv
wget
ranger
firefox
git
lsd
dtrx
blender
vscode
qt5.qtwayland
qt6.qtwayland
pokeget-rs
nmap
pywal16
pywalfox-native
mullvad-browser
android-studio-tools
android-studio-full
wireguard-tools
elephant
timg
networkmanagerapplet
xdg-desktop-portal-gtk
hyprpolkitagent
gh
jq
yq
xq
pokeget-rs
gomatrix
protonvpn-gui
sioyek
gnumake
gcc
ripgrep     
fd          
unzip   
fzf      
nix-direnv
viu
chafa
ueberzugpp
tree-sitter
alacritty
ghostty
bc
];

fonts.packages = with pkgs;[
nerd-fonts.victor-mono
nerd-fonts.caskaydia-cove
maple-mono.NF-CN-unhinted
nerd-fonts.jetbrains-mono
];

fonts.fontconfig = {
enable = true;
antialias = true;
hinting.enable = false;
subpixel.rgba = "rgb";
defaultFonts.monospace = [ 
"Jetbrains Mono NF" 
"Maple Mono NF" 
"Victor Mono NF" 
"CaskaydiaCove Nerd Font Mono"
];
};

hardware.bluetooth.enable = true;
services.blueman.enable = true;
hardware.bluetooth.settings = {
General = {
Enable = "Source,Sink,Media,Socket";
  };
};

services.pipewire.wireplumber.extraConfig."10-bluez" = {
"monitor.bluez.properties" = {
"bluez5.enable-sbc-xq" = true;
"bluez5.enable-msbc" = true;
"bluez5.enable-hw-volume" = true;
"bluez5.roles" = [
"hsp_hs"
"hsp_ag"
"hfp_hf"
"hfp_ag"];};};

services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
#jack.enable = true;
#media-session.enable = true;
};
services.gnome.gnome-keyring.enable = true;

services.gvfs.enable = true;
}
