{
  description = "Haskell GTK GUI App";

  inputs = {
    haskellNix.url = "github:input-output-hk/haskell.nix";
    nixpkgs.follows = "haskellNix/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, haskellNix }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      overlays = [
        haskellNix.overlay
        (final: prev: {
          gui-app = final.haskell-nix.stackProject' {
            src = ./.;
          };
        })
      ];
      pkgs = import nixpkgs {
        inherit system overlays;
        inherit (haskellNix) config;
      };
      flake = pkgs.gui-app.flake { };
    in flake // {
      defaultPackage = flake.packages."gui-app:exe:gui-app";
    });
}
