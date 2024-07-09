# final: prev:
# {
#  awscli-overlay = prev.awscli2.overrideAttrs (old: {
#    src = prev.fetchFromGitHub {
 #     owner = "aws";
 #     repo = "aws-cli";
 #     rev = "3839a515507462d517147e3561a085614a51d581";
      # If you don't know the hash, the first time, set:
      # hash = "";
      # then nix will fail the build with such an error message:
      # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
      # specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
      # got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
      # hash = "173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4";
 #     hash = "";
 #   };
 # });
#}
