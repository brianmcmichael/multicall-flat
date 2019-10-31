# Testing out hevm flatten on Multicall

Drop into `nix-shell` to require the right tools:

```sh
nix-shell
```

Clone smart contract dependencies into `./lib`:

```sh
dapp2nix clone-recursive lib
```

Make changes to the contracts in `./lib` and test flattening them with:

```sh
nix-build --arg srcRoot ./lib
```

The output will be in `result/dapp/*/out/*.sol.flat`.
