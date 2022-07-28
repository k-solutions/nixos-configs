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
      unzip
      htop

      # nodejs is needed for vim language-server
      nodejs

      # opera
      # NOTE: iana-etc is needed by nix-build for stack 
      # stack
      # iana-etc
      # Activate cachix
      cachix
      # used havy for cli commands
      # jq	   	
      
      # dconf for gnome3 UI
      dconf

      # docker-compose

      # Kube infrastructure
      # minikube
      # helm
      # terraform
      # aws
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
    };
    
    git = {
        enable = true;
        userName = "Hristo Kochev";
        userEmail = "h.l.kochev@gmail.com";
        aliases = { s = "status"; };
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
  };
}
