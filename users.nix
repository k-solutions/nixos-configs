{config, lib, pkgs, ...}:

{
 users.users = {
   nginx = {
	extraGroups = [ "users" ];
        isNormalUser = true;
   };
   me = {
     isNormalUser = true;
     uid = 1000;
     home = "/home/me";
     extraGroups = [
       	"wheel"
   	"networkmanager"
	"video"
	"audio"
	"docker"
        "nginx"
     ];
   };
 };
}
