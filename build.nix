{ mkDerivation, base, gtk-traymanager, gtk3, stdenv }:
mkDerivation {
  pname = "gui-app";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base gtk3 ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
