let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {};

  haskellPackages = pkgs.haskellPackages.extend (final: prev: {
    gui-app = pkgs.haskellPackages.callCabal2nix "gui-app" ./. {};
  });
in

{
  inherit (haskellPackages) gui-app;
  dev-shell = haskellPackages.shellFor {
    packages = p: [ p.gui-app ];
    buildInputs = with pkgs; [
      cabal-install
      ghcid
    ];
  };
}
