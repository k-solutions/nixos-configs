{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.me = import ./home.nix { inherit config pkgs; };
  #{
  #  /* Here goes your home-manager config, eg home.packages = [ pkgs.foo ]; */
  #};
}
