{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs {}
}:

pkgs.haskell.packages.ghc881.callPackage ./build.nix {}
