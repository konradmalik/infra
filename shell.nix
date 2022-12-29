let
  flakeLock = builtins.fromJSON (builtins.readFile ./flake.lock);
  nixpkgsRev = flakeLock.nodes.nixpkgs.locked.rev;
  lockedNixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/${nixpkgsRev}.tar.gz") { };
in
{ pkgs ? lockedNixpkgs }:
with pkgs;
mkShell {
  nativeBuildInputs = [
    nil
    nixpkgs-fmt
    ansible
    ansible-lint
    yaml-language-server
  ];
}
