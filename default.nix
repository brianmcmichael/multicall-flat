{ srcRoot ? null }:

let
  inherit (builtins) mapAttrs;
  dappPkgs = import (fetchGit {
    url = "https://github.com/icetan/dapptools";
    ref = "nix-solpkg-flatten";
  }) {};
  inherit (dappPkgs.callPackage ./dapp2.nix { inherit srcRoot; })
    specs packageSpecs;
  flatSpecs = mapAttrs (_: spec: spec // { flatten = true; })  specs.this.deps;
in packageSpecs flatSpecs
