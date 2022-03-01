{config, lib, pkgs, ...}:

{
 users.users = {
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
     ];
   };
 };
}
