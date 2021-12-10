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
      <home-manager/nixos>                        # NOTE; could not build this and it trys to build gtk3 ?  
      # Define a user account. Don't forget to set a password with ‘passwd’.
      ./users.nix  
    ];
 
  # boot opions from nixos-source
  boot = import ./boot.nix {inherit config pkgs;}; 
  # List services that you want to enable:
  # programs.dbus.enable = true;
  services = import ./services.nix {inherit config pkgs;};
  networking = import ./networking.nix {inherit config pkgs;};
  systemd = import ./systemd.nix {inherit config pkgs;};
# Containers
#####################
#   containers = {
#     web = {
# 	autoStart = true;
# 	privateNetwork = true;
# 	};
#  };
# Virtualisation
######################33  
# virtualisation.docker.enable = true;
# NOTE: was needed for ruby VM 
# virtualisation.libvirtd.enable = true;
# virtualisation.libvirtd.enableKVM = true;
# VPNC settings
# vpnc = {
#    enable = true;
# }; 
# The NixOS release to be compatible with for stateful data such as databases.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-unstable;  
  system.stateVersion = "19.03";
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
