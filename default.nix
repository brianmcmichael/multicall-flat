{ srcRoot ? null }:

let
  inherit (builtins) mapAttrs all attrNames;
  #dappPkgs = import ~/src/maker/dapptools {};
  dappPkgs = import (fetchGit {
    url = "https://github.com/icetan/dapptools";
    ref = "nix-solpkg-flatten";
    rev = "9ff641f442b812e8a07a04f8fc97986e03647dae";
  }) {};
  inherit (dappPkgs.callPackage ./dapp2.nix { inherit srcRoot; })
    specs packageSpecs;
  flatSpecs = mapAttrs
    (_: spec: spec // { flatten = true; })
    specs.this.deps;
in packageSpecs flatSpecs
