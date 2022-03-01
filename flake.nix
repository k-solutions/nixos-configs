{
  description = "Home Manager NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    }; 	
  };

  outputs = { self, home-manager, nixpkgs, ... }@inputs: {
    # nix.registry.n ixpkgs.flake = nixpkgs;	
    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ({ pkgs, config, lib, ... }: {
	     imports = [	
		  ./configuration.nix
		  home-manager.nixosModules.home-manager
		  {
		    home-manager = { 
			useGlobalPkgs = false;
			useUserPackages = true;
			users.me = import ./home.nix { inherit config pkgs; };
		    # Optionally, use home-manager.extraSpecialArgs to pass
		    # arguments to home.nix
		    };	
		  }
	      ];	
	  })	
        ];
      };
    };
  };
}
