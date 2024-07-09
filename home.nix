{ config, pkgs, ... }:
{ # Version control
  home.stateVersion = "21.11";	 
  home.packages = with pkgs; 
  [
      ctags
      rsync
      gnutar
      # needed for Xmonad
      feh
      # rxvt_unicode-with-plugins
      # some X packages
      xsel
      # vlc
      pavucontrol 
      # unrar
      # unzip
      htop

      # nodejs is needed for vim language-server
      nodejs

      # browsers 
      #	opera
      # chromium
      # NOTE: iana-etc is needed by nix-build for stack 
      # stack
      # iana-etc
      # Activate cachix
      cachix
      # used havy for cli commands
      jq	   	
      
      # dconf for gnome3 UI
      dconf
      # Devenv.sh
      devenv	 
      # docker-compose

      # Kube infrastructure
      # minikube
      # kubernetes-helm
      (wrapHelm kubernetes-helm { plugins = [
	  kubernetes-helmPlugins.helm-s3
	  kubernetes-helmPlugins.helm-git

	]; })
      terraform
      kubectl
      kubectx
      kops
      awscli2		
#      (awscli2.override {
#        overrideAttrs = overrideAttrs (old: {
#          src = fetchFromGitHub {
#            owner = "aws";
#            repo = "aws-cli";
#            rev = "3839a515507462d517147e3561a085614a51d581";
#            # If you don't know the hash, the first time, set:
#            # hash = "";
#            # then nix will fail the build with such an error message:
#            # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
#            # specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
#            # got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
#            # hash = "173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4";
#            hash = "";
#          };
#  	}); 
#      })
  ];

  # Raw configs
  home.file.".Xresources".source = ./Xresources;  

  # X Sessions
  xsession = {
    enable = true;
    windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = ./xmonad.hs;
          extraPackages =  haskellPackages: [
            haskellPackages.xmonad-contrib
            haskellPackages.monad-logger
            haskellPackages.xmobar
          ];       
        };
      }; 
  };
 
  # NOTE: disable man pages generation as it is raises error
  manual.manpages.enable = false;
 
  programs = {
    jq.enable = true;	
    # chromium.enable = true; 
    direnv = {
      enable = true;
      nix-direnv = {
	enable = true; 	
      };		 	
    };
    		 
    # dconf.enable = true; # add for gnome programs (opera, firefox etc.)
    home-manager.enable = true;

    bash = {
      enable = true;
      historyControl = ["erasedups"];
      historyIgnore = [ "ls" "cd" "exit" "nix-shell" ];
      sessionVariables = { ERL_AFLAGS = "-kernel shell_history enabled"; };
      bashrcExtra = ''
	  /home/me/.bash_kube	
	'';	
    };
    
    git = {
        enable = true;
        userName = "Hristo Kochev";
        userEmail = "h.l.kochev@gmail.com";
        aliases = { s = "status"; };
	extraConfig = {
	  include = {
	    path = "~/.gitconfig.global";
          };	
	};	
  
    };

    neovim = {
	enable = true;
#         vimAlias = true;
	extraConfig = builtins.readFile (./init.vim);
	plugins = import (./vimPlugins.nix) {inherit pkgs;};

#	plugins = with pkgs.vimPlugins; [
#         nvim-lspconfig
#         vim-go
#	 coc-nvim
#         # coc-deno
##     	 nvim-tree-lua {
##      	   aiken-lang/editor-integration-nvim 
##,
##           dependencies = {
##            'neovim/nvim-lspconfig',
##           }	           	
##         }	  
#        ];	
    };	
    vim = {
        enable = true;
        extraConfig = builtins.readFile (./vimrc);
        plugins = import (./vimPlugins.nix) {inherit pkgs;};
        settings = {
          history = 1000;
          background = "dark";
          number = true;
          tabstop = 2;
        };
    };
      
    tmux = {
      enable = true;
      clock24 = true;
      # shortcut = "a";
      extraConfig = builtins.readFile(./tmux.conf);
    };

  # Browsers and Extensions
    firefox = {
      enable = true;
      # enableIcedTea = true;
      # extraPackages = epkgs: [ ];
    }; 

    chromium = {
      enable = true;
    };
  };
}
