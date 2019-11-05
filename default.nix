{ srcRoot ? null }:

let
  inherit (builtins) mapAttrs all attrNames;
  dappPkgs = import (fetchGit {
    url = "https://github.com/icetan/dapptools";
    ref = "nix-solpkg-flatten";
    rev = "f8d7460249ebfea35632ca3848716574e94dfb5f";
  }) {};
  inherit (dappPkgs.callPackage ./dapp2.nix { inherit srcRoot; })
    specs packageSpecs;
  flatSpecs = mapAttrs
    (_: spec: spec // { flatten = true; doCheck = false; })
    specs.this.deps;
in packageSpecs flatSpecs
