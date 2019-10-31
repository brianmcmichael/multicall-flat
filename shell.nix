let
  dapp2nix = import (fetchGit {
    url = "https://github.com/icetan/dapp2nix";
    ref = "v2.1.2";
    rev = "e0791aae4e87481179828606d6021dfbcd40a0a5";
  }) {};
in (import <nixpkgs> {}).mkShell {
  buildInputs = [ dapp2nix ];
}
