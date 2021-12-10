pkgs : {
  allowUnfree = true;
  # ignoreCollisions = true;
  allowBroken = true;
  # firefox.enableGoogleTalkPlugin = true;
  # firefox.enableEsteid = true;

  # chromium = {
  #  enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
  # enablePepperPDF = true;
  # };

  packageOverrides = pkgs : with pkgs; rec  {
    myHaskellEnv = (import ./haskell.nix pkgs).haskellEnv; 
    myVim = import ./vim.nix;
      my = pkgs.buildEnv {
        name = "my";
        paths = [
          stdenv.cc.cc.lib
          myHaskellEnv
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
