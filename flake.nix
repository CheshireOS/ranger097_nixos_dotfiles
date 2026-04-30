{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    nixvim = {
       url = "github:nix-community/nixvim";
       inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
    lanzaboote = {
       url = "github:nix-community/lanzaboote/v1.0.0";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
       url = "github:nix-community/impermanence";
       inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
       url = "github:nix-community/NUR";
       inputs.nixpkgs.follows = "nixpkgs";
    };


  };
 
  outputs = { self, nixpkgs, nixvim, home-manager, lanzaboote, impermanence, ... }@inputs: {


  nixosConfigurations = {
     deoxy = nixpkgs.lib.nixosSystem {
     specialArgs = { inherit inputs nixvim; };
     modules = [
     { nixpkgs.hostPlatform = "x86_64-linux"; }
      ./hosts/deoxy/hardware-configuration.nix
      ./configuration.nix
        home-manager.nixosModules.home-manager
        lanzaboote.nixosModules.lanzaboote
	nixvim.nixosModules.nixvim
        impermanence.nixosModules.impermanence
	inputs.nur.modules.nixos.default

     ({ pkgs, lib, ... }: {
        networking.hostName = "deoxy";
        boot.loader.systemd-boot.enable = lib.mkForce true;
        boot.lanzaboote = {
        enable = false;
        pkiBundle = "/var/lib/sbctl";
      };
   })

  {
      home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.ranger = import ./home.nix;
      backupFileExtension = "backup";
      extraSpecialArgs = { inherit inputs; };
      };
  }
  
];
};  

   jirachi = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs nixvim; };
      modules = [
       { nixpkgs.hostPlatform = "x86_64-linux"; }
       ./hosts/jirachi/hardware-configuration.nix
       ./configuration.nix
         home-manager.nixosModules.home-manager
         lanzaboote.nixosModules.lanzaboote
	 nixvim.nixosModules.nixvim
         impermanence.nixosModules.impermanence  
	 inputs.nur.modules.nixos.default

   ({ pkgs, lib, ... }: {
      networking.hostName = "jirachi";
      boot.loader.systemd-boot.enable = lib.mkForce true;
      boot.lanzaboote = {
         enable = false;
         pkiBundle = "/var/lib/sbctl";
      };   
   })  

  {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.ranger = import ./home.nix;
      home-manager.backupFileExtension = "backup";
      home-manager.extraSpecialArgs = { inherit inputs; };
   }

   ];
};
};
};
}
