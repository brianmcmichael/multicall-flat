let
  dapp2nix = import (fetchGit {
    url = "https://github.com/icetan/dapp2nix";
    ref = "v2.1.3";
    rev = "a82d8b06341a2fd53419831c6464006ecb8c8190";
  }) {};
in (import <nixpkgs> {}).mkShell {
  buildInputs = [ dapp2nix ];
}
