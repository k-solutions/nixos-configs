{config, lib, pkgs, ...}:

{
  powerManagement.enable = true;

  hardware = {   
    pulseaudio.enable = true;
    brightnessctl.enable = true;
    cpu.intel.updateMicrocode = true;
  };
  # ALSA Sound extra configuration
  sound.extraConfig = "ALSA_CARD=HDMI";	
  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Sofia";


  fileSystems."/data" =
  { device = "/dev/disk/by-label/data";
    fsType = "ext4";
    options = [ "nofail" ];
  };
  
  # swap
  swapDevices = [{device = "/swapfile"; size = 8000;}];
} 
