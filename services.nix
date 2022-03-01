{config, pkgs, ...}:

{
  # List services that you want to enable:
  # services.vpnc.enable = true; 
  # Enable the OpenSSH daemon.
    openssh.enable = true;
    sshd.enable = true;	
  #  udisk2.enable = true; 
    devmon.enable = true; # automounitng of external devices		
  # syslog-ng
    syslog-ng.enable = true;
    syslogd.enableNetworkInput = true;
    # Should be active now 
    journald.forwardToSyslog = true; 

  # storage and NFS shares options
  # storage = 
  #  {
  # services.portmap.enable = true;
  # services.nfs.server.enable = true;
  # services.nfs.server.exports = ''
  #      /data/home/me 10.0.2.2(rw,no_root_squash,no_subtree_check,fsid=0)
  # '';
  # services.nfs.server.createMountPoints = true;
  #  };

  # OpenVPN service
  # openvpn.servers = {
  #  officeVPN = { 
  #    config = '' config /etc/nixos/hristo.koshev.ovpn '';
  #    autoStart = false;
  #    updateResolvConf = false; # true; NOTE: Will produce unresolvable DNS network
  #  };
  # };

  # ZFS settings
  zfs = {
     autoSnapshot = {
       enable = true;
       frequent = 8;
       monthly = 1;	
     };

     trim.enable = true;
     autoScrub.enable = true;
  };	
  
  udev.extraRules = ''
    ACTION=="add|change", KERNEL=="sd[a-z]*[0-9]*|mmcblk[0-9]*p[0-9]*|nvme[0-9]*n[0-9]*p[0-9]*", ENV{ID_FS_TYPE}=="zfs_member", ATTR{../queue/scheduler}="none"
  '';
  # sockets.systemd-rfkill.enable = false;
  # systemd-rfkill.enable = true;

  # TLP enable
  tlp = { 
	enable = true;
   	settings = {
		# [GENERAL]
		# SYSFS path for checking if the system is running on AC power
		# Sysfs_Power_Path = /sys/class/power_supply/AC*/online;
	    	# TLP DEFAULT Laptop tweeks
	    	# CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
	       	WIFI_PWR_ON_AC = "off";
	       	USB_AUTOSUSPEND = 0;
	       	NATACPI_ENABLE = 1;
	       	TPACPI_ENABLE = 1;
	       	TPSMAPI_ENABLE = 0;
	       	# Battery charge treshold
		START_CHARGE_THRESH_BAT0 = 83; 
	       	STOP_CHARGE_THRESH_BAT0  =85;
      	};
  };      
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  xserver = { 
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      # synaptics.enable = false;
      libinput.enable = true;
  # services.xserver.vaapiDrivers = [ pkgs.vaapiIntel ];
  
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # svervices.xserver.desktopManager.kde4.enable = true;
  # desktopManager.xfce.enable = true;  
  # services.xserver.desktopManager.enlightenment.enable = true;
# 	windowManager = {
# 	     xmonad = {
# 	 	  config = ./xmonad.hs;
# 	          enable = true;
# 	          enableContribAndExtras = true;
# 	          extraPackages = haskellPackages: with haskellPackages; [
# 	            xmonad-contrib
# 	            xmonad-extras
# 		    monad-logger
# 	            xmobar
# 	          ];
# 	     };
# 	}; 
      desktopManager.xterm.enable = false;
      displayManager = {
        defaultSession = "hm-xmonad";
	session = [
	  {
 	    manage = "desktop";
            name = "hm-xmonad";
            start = ''exec $HOME/.xsession'';   	
          }			
	];
      };
   };
  # Add Ledger udev rules
  udev.packages = with pkgs; [
  	  ledger-udev-rules	
	];		
  # services.xserver.desktopManager.e17.enable = true;
    pcscd.enable = true; # pcsc-lite daemon  
    dbus.packages = with pkgs; [ dconf ];
 }
