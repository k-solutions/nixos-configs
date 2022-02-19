{ config, pkgs, ... }: 
{ 
  elmEnv = pkgs.elmPackages
             (elmPackages: with elmPackages; [
                 elm
                 elm-format
                 elm-test
                 elm-review
                 elm-language-server
               ]
             );
                 
}
