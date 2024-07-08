pkgs: 
{ 
  haskellEnv = pkgs.haskellPackages.ghcWithHoogle
                 (haskellPackages: with haskellPackages; [
                   # libraries
                   # arrows async cgi 
                   # criterion
                   # pretty-show
                   # temporary 
                   
                   # cabal
                   cabal-install
                   cabal2nix

                   # Haskell language server 
                   # ghcup 
                   
                   # test && linters
                   doctest 
                   hlint 
                   stylish-haskell
                   # haddock-2.24.2
                   haskell-language-server  # .override { supportedGhcVersions = [ "8107" ]; }      
                   implicit-hie

                   # tools
                   hpack
                   hasktags
                   # summoner
                   # hdevtools
                   # ghcid
                   # ghc-mod  
                   # niv  
                   # tools
                   
                   stack
                   # stack2nix
                 ]);
   stackEnv = pkgs.haskellPackages.ghcWithHoogle
                 (haskellPackages: with haskellPackages; [
                   # test && linters
                   doctest 
                   hlint 
                   stylish-haskell
                   # haddock-2.24.2
                   haskell-language-server  # .override { supportedGhcVersions = [ "8107" ]; }      
                   implicit-hie

                   # tools
                   hasktags
                   stack	
                 ]);
                 
}
