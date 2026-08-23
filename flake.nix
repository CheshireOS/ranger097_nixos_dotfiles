{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    nixvim = {
       url = "github:nix-community/nixvim";
       inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    }; 

  };
 
  outputs = { self, nixpkgs, nixvim, home-manager, ... }@inputs: {


  nixosConfigurations = {
     deoxy = nixpkgs.lib.nixosSystem {
     specialArgs = { inherit inputs nixvim; };
     modules = [
     { nixpkgs.hostPlatform = "x86_64-linux"; }
      ./hosts/deoxy/hardware-configuration.nix
      ./configuration.nix
        home-manager.nixosModules.home-manager
	nixvim.nixosModules.nixvim

     ({ pkgs, lib, ... }: {
        networking.hostName = "deoxy";
        boot.loader.systemd-boot.enable = lib.mkForce true;
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
	 nixvim.nixosModules.nixvim  

   ({ pkgs, lib, ... }: {
      networking.hostName = "jirachi";
      boot.loader.systemd-boot.enable = lib.mkForce true;
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
