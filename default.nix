{ srcRoot ? null
, dappPkgsSrc ? fetchGit {
    url = "https://github.com/icetan/dapptools";
    ref = "nix-solpkg-flatten";
    rev = "f8d7460249ebfea35632ca3848716574e94dfb5f";
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
