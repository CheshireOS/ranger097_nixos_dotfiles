{ config, pkgs, lib, ... }:{
 
    programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;
    plugins.lualine.enable = true;
    
    opts = {
      number = true;         
      relativenumber = true; 
      shiftwidth = 2;   
    };
  };



}
