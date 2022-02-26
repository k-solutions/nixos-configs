# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix                                # set of packages to be install on systtem env
      ./locals.nix                                  # disks and locals settings 
      # <home-manager/nixos>  
      # Define a user account. Don't forget to set a password with ‘passwd’.
      ./users.nix 
      # ./cachix.nix	
      # ./yubikey.nix   # Yubikey and Smart Card configurations			 
    ];

  environment.variables.EDITOR = "vim";
  # boot opions from nixos-source
  boot = import ./boot.nix {inherit config pkgs;}; 
  # List services that you want to enable:
  services = import ./services.nix {inherit config pkgs;};
  networking = import ./networking.nix {inherit config pkgs;};
  systemd = import ./systemd.nix {inherit config pkgs;};
  
  # Home Manager	
  # home-manager.users.me = import ./home.nix {inherit config pkgs; };
	
	# Containers
	#####################
	containers = {
	#     web = {
	# 	autoStart = true;
	# 	privateNetwork = true;
	# 	};
		pgSql = { 
                   config = {config, pkgs, ...}:  
			    { services.postgresql.enable = true;
  			      services.postgresql.package = pkgs.postgresql; 	
			    };
                   autoStart = true;
		   # privateNetwork = true;
                   	
                }; 
	};
	
	# Virtualisation
	######################  
	virtualisation.docker.enable = true;
	# NOTE: was needed for ruby VM 
	# virtualisation.libvirtd.enable = true;
	# virtualisation.libvirtd.enableKVM = true;
	# VPNC settings
	# vpnc = {
	#    enable = true;
	# }; 
	# The NixOS release to be compatible with for stateful data such as databases.

  system.autoUpgrade = { 
  	enable = false;
  	channel = https://nixos.org/channels/nixos-unstable;
  };
  
  nix = {
    gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 30d";
    };
    # trustedUsers = ["root" "me"];
    binaryCaches          = [ "https://hydra.iohk.io" "https://iohk.cachix.org" ];
    binaryCachePublicKeys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" ];
    # registry.nixpkgs.flake = nixpkgs;	
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      allow-import-from-derivation = true	
    '';
  };	
}
