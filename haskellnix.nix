{
  pkgs ? import ./haskellnixpkgs.nix {},
}:

let
  haskellPkgs = pkgs.haskell-nix.stackProject {
    src = pkgs.haskell-nix.haskellLib.cleanGit { src = ./.; };
  };
in
  haskellPkgs.gui-app.components.exes.gui-app
