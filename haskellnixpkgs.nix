{
  nixpkgs ? builtins.fetchTarball "https://github.com/input-output-hk/nixpkgs/archive/a8f81dc037a5977414a356dd068f2621b3c89b60.tar.gz",
  haskellNix ? import (builtins.fetchTarball https://github.com/input-output-hk/haskell.nix/archive/master.tar.gz),
}:

import nixpkgs haskellNix
