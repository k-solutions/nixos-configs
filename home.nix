{ config, pkgs, ... }:
{ # Version control
  home.stateVersion = "24.11";
  home.packages = with pkgs;
  [
      # Required for AI assistant
      # zoom-us
      # uv
      # Uv2nix
      # all C tags
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
      # Bluetooth support 
      bluez 
      # dconf for gnome3 UI
      dconf
      # Devenv.sh
      devenv
      # Nix LSP
      nixd
      # Google SDK 
      # google-cloud-sdk
      # Podman tools
      # podman-compose
      # docker-compose
      # Kube infrastructure
      # minikube
  ];

  # Raw configs
  home.file.".Xresources".source = ./Xresources;
  home.sessionVariables = {
    OPENAI_API_KEY = "user-P1OmwJ4uy4f0tT1Ta3EMawQZ/";
  };
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
    # nix-ld.enable = true;   # for UV to be able to exec programs, required for AI tools
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
      sessionVariables = {
        ERL_AFLAGS = "-kernel shell_history enabled"; 
      };
      bashrcExtra = ''
        /home/me/.bash_kube
      '';
    };
    git.settings = {
        enable = true;
        user = { 
        name = "Hristo Kochev";
          email = "h.l.kochev@gmail.com";
        };
        aliases = { s = "status"; };
        extraConfig = {
          include = {
            path = "~/.gitconfig.global";
          };
        };
    };
    neovim = {
        enable = true;
        vimAlias = false;
        extraConfig = builtins.readFile (./init.vim);
        plugins = import (./vimPlugins.nix) {inherit pkgs;};
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
      package = pkgs.firefox-beta;
      # enableIcedTea = true;
      # extraPackages = epkgs: [ ];
    }; 
    chromium = {
      enable = true;
    };
  };
}
