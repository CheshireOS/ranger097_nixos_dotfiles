{ config, pkgs, lib, ... }:

{
imports = [ 
  ./desktops/cosmic.nix
  ./desktops/hyprland.nix
  ./packages.nix
  ./bash/bash.nix
  ./wifi/wifi.nix
  ./development/nixvim.nix
  ./development/tmux.nix
  ./security/security.nix
];
  
# Bootloader & Kernel
boot.loader.systemd-boot.enable = false;
boot.lanzaboote.enable = false;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.timeout = 0; 
boot.kernelPackages = pkgs.linuxPackages_latest;

# Hardware Drivers & Kernel Params
boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
boot.blacklistedKernelModules = [ "nouveau" ];
  
# Networking
time.timeZone = "America/New_York";
i18n.defaultLocale = "en_US.UTF-8";
networking.networkmanager.wifi.scanRandMacAddress = true;  

# NVIDIA Setup
nixpkgs.config.allowUnfree = true;
services.xserver.videoDrivers = ["nvidia"];
hardware.graphics.enable = true;
hardware.graphics.enable32Bit = true;
hardware.nvidia = {
modesetting.enable = true;
open = true; 
nvidiaSettings = true;
};

# Wayland / Hyprland fixes
environment.sessionVariables = {
LIBVA_DRIVER_NAME = "nvidia";
GBM_BACKEND = "nvidia-drm";
__GLX_VENDOR_LIBRARY_NAME = "nvidia";
NIXOS_OZONE_WL = "1";
WLR_NO_HARDWARE_CURSORS = "1"; 
};

users.users.ranger = {
isNormalUser = true;
extraGroups = [ "networkmanager" "wheel" ];
};

nix.settings = {
   experimental-features = [ "nix-command" "flakes" ];
   warn-dirty = false;
};

# Versioning - Set to Unstable/Next Release
system.stateVersion = "25.11"; 
}
