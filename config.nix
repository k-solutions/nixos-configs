pkgs : {
  allowUnfree = true;
  # ignoreCollisions = true;
  allowBroken = true;
  firefox.enableGoogleTalkPlugin = true;
  # firefox.enableEsteid = true;

  # chromium = {
  #  enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
  # enablePepperPDF = true;
  # };

  packageOverrides = pkgs : with pkgs; rec  {
    myHaskellEnv = (import ./haskell.nix pkgs).haskellEnv; 
    myStackEnv = (import ./haskell.nix pkgs).stackEnv;
    myVim = import ./vim.nix;
    my = pkgs.buildEnv {
        name = "my";
        paths = [
          stdenv.cc.cc.lib
          myHaskellEnv
          myStackEnv
          myVim
          neovim
          niv
          ctags
          # rsync
          # firefox
          # opera
        ];
    };
  };
}
