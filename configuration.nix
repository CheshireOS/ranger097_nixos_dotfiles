{ config, pkgs, lib, ... }:

{
imports = [ 
  ./desktops/niri.nix
  ./packages.nix
  ./bash/bash.nix
  ./wifi/wifi.nix
  ./development/nixvim.nix
  ./security/security.nix
];

fileSystems."/" = {
  device = "/dev/disk/by-uuid/70b719d7-740a-48dc-95c8-0134766573f5";
  fsType = "ext4";
};

# Bootloader & Kernel
boot = {
  loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    timeout = 0;
  };

  plymouth = {
    enable = true;
    theme = "spinfinity";
  };

    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = [ "nouveau" ];
    initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
      "i915.enable_guc=0"
    ];
  };

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
MOZ_ENABLE_WAYLAND = "1";
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
system.stateVersion = "26.05"; 
}
