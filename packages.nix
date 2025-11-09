{config, lib, pkgs, ...}:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
     pciutils
     # rfkill
     usbutils
     # telnet
     inetutils
     traceroute
     tree
     wget
     curl
     git
     openssh
     openconnect	
     devenv	
     # vpnc 
     # NOTE: not needed currently
     vim
     # For the KVM and Ruby VM
     # kvm
     # qemu
     # bridge-utils
     powertop
     # tlp
     acpi
     linuxPackages.acpi_call
     tpacpi-bat
     # linuxPackages.tp_smapi
     # busybox
     # binutils
     # --- Terminals ---
     # rxvt-unicode
     # rxvt_unicode-with-plugins
     st
     alacritty
     # --- X11 packages ----
     # chromium
     # firefoxWrapper
     # trayer
     stalonetray
     dmenu
     # xscreensaver
     xclip
     #xchat
     # Font junk
     xfontsel
     xlsfonts
     # xmodmap
     # xcompmgr  
     # Backlight 
     brightnessctl
     # xorg.xbacklight  
     # haskell staff  
     # haskellPackages.haskellPlatform
     # cabal2nix
     # Haskell packages for XMonad
     haskellPackages.xmobar
     haskellPackages.xmonad
     haskellPackages.xmonad-contrib
     haskellPackages.xmonad-extras
     haskellPackages.yeganesh
     # Tools && Utils
     # htop
     # universal-ctags
     # feh
     # Browsers and UI tools
     # firefox 
     # gnome3.dconf 
  ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease	 
      # corefonts
      dina-font
      fantasque-sans-mono
      gohufont
      inconsolata
      proggyfonts
      #source-code-pro
      ubuntu-classic 
      #ipafont
      kochi-substitute
    ];
  };
} 
