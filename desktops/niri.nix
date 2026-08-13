{ config, lib, pkgs, ... }: {

programs.niri.enable = true;
services.xserver.enable = true;
services.displayManager = {
                sddm.enable = true;
sddm.wayland.enable = true;

                autoLogin = {
                enable = true;
                user = "ranger";
        };
        };


}
