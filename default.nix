{ srcRoot ? null
, dappPkgsSrc ? fetchGit {
    url = "https://github.com/icetan/dapptools";
    ref = "nix-solpkg-flatten";
    rev = "910b560957e316c392b661f1970fba26881e1176";
  }
}:

let
  inherit (builtins) mapAttrs;
  dappPkgs = import dappPkgsSrc {};
  inherit (dappPkgs.callPackage ./dapp2.nix { inherit srcRoot; })
    specs packageSpecs;
  flatSpecs = mapAttrs
    (_: spec: spec // { flatten = true; doCheck = false; })
    specs.this.deps;
in packageSpecs flatSpecs
