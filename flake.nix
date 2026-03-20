{
  description = "System flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    nvf.url = "github:notashelf/nvf";
    
    lanzaboote = {
    url = "github:nix-community/lanzaboote/v1.0.0";
    inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  

  };
 

  outputs = { self, nixpkgs, nvf, home-manager, lanzaboote, ... }@inputs: {
   

  nixosConfigurations = {
     deoxy = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = { inherit inputs; };
     
     modules = [
      ./hosts/deoxy/hardware-configuration.nix
      ./configuration.nix
        home-manager.nixosModules.home-manager
        lanzaboote.nixosModules.lanzaboote
        nvf.nixosModules.default
    
     ({ pkgs, lib, ... }: {
        networking.hostName = "deoxy";
        boot.loader.systemd-boot.enable = lib.mkForce false;
        boot.lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
   })

  {
      home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.ranger = import ./home.nix;
      backupFileExtension = "backup";
      };
  }
  
];
};  

   jirachi = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
       ./hosts/jirachi/hardware-configuration.nix
       ./configuration.nix
         home-manager.nixosModules.home-manager
         lanzaboote.nixosModules.lanzaboote
         nvf.nixosModules.default

   ({ pkgs, lib, ... }: {
      networking.hostName = "jirachi";
      boot.loader.systemd-boot.enable = lib.mkForce false;
      boot.lanzaboote = {
         enable = true;
         pkiBundle = "/var/lib/sbctl";
      };   
   })  

  {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.ranger = import ./home.nix;
      home-manager.backupFileExtension = "backup";
   }


   ];
};
};
};
}
