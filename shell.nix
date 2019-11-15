let
  dapp2nix = import (fetchGit {
    url = "https://github.com/icetan/dapp2nix";
    ref = "v2.1.6";
    rev = "f69bccc4aaaa2be30bfd52d005c3d7edfe86e855";
  }) {};
in (import <nixpkgs> {}).mkShell {
  buildInputs = [ dapp2nix ];
}
