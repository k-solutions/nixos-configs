{ config, pkgs, lib, ... }:
{
    # Use the GRUB 2 boot loader.
    # loader.grub.enable = true;
    # loader.grub.version = 2;
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";
    
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.supportedFilesystems = [ "zfs" ];
    supportedFilesystems = [ "zfs" ];
    zfs = { 
		requestEncryptionCredentials = true;
	   	devNodes = "/dev/";
 	};

    # Define on which hard drive you want to install Grub.
    loader.grub.device = "/dev/sda"; # or "nodev" for efi only
    # [ "tun" "virtio" "cpufreq_stats"  "acpi" "thinkpad-acpi" "tp_acpi" ];
    # kernelParams = pkgs.linuxPackages_latest; 
      # [
      # "rtw89pci"      
      # ];
    
    initrd.kernelModules = ["acpi" "thinkpad-acpi" ];
    
}
