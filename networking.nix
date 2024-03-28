{config, pkgs, ...}:

{
    hostId = "cd5aacab";       # ZFS request setting	
    hostName = "thinkpadT14";     # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # nameservers = ["8.8.8.8"  "8.8.4.4"];
    networkmanager.enable = true;
    firewall = {
       enable = false;  
#      allowPing = true;
#      allowedTCPPorts = [ 
#        22 80 111 443 2049 875 893 2049 8080 9000 10053 32769 
#      ];
#      allowedTCPPortRanges = [
#        { from = 8000; to = 8100; }
#        { from = 55000; to = 60000; }
#      ];
#
#      allowedUDPPortRanges = [
#        { from = 9000; to = 10000; }
#        { from = 55000; to = 60000; }
#      ];
    };  
  
    useDHCP = false;
    interfaces.enp2s0f0.useDHCP = true;
    interfaces.enp5s0.useDHCP = true;
    interfaces.wlp7s0f3u2.useDHCP = true;

    extraHosts = 
	''
            127.0.0.1 pab.docs
    	    127.0.0.1 plutus.docs
            127.0.0.1 db
        '';

    # nat = {
    #    internalInterfaces = ["ve-+"];
        # externalInterface = "enp0s20f0u6";
        # externalInterface = "wlp4s0";
    # };

#    Forwarding for the Ruby VM
#      ${pkgs.vde2}/bin/vde_switch -tap tap0 -mod 660 -group kvm -daemon
#      ip addr add 10.0.2.1/24 dev tap0
#      ip link set dev tap0 up
#      ${pkgs.iptables}/sbin/iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -j MASQUERADE
#  Forwarding for the OpenVPN 
#   localCommands =
#    ''
#      ${pkgs.procps}/sbin/sysctl -w net.ipv4.ip_forward=1
#      ${pkgs.iptables}/sbin/iptables -I FORWARD -i ton0 -o wlp4s0 -s 10.136.255.0/24 -m conntrack -ctstate NEW -j ACCEPT
#      ${pkgs.iptables}/sbin/iptables -I FORWARD -m conntrack -ctstate RELATED,ESTABLISHED -j ACCEPT
#      ${pkgs.iptables}/sbin/iptables -t nat -A POSTROUTING -o wlp4s0 -s 10.136.255.0/24 -j MASQUERADE
#   '';
	
}
