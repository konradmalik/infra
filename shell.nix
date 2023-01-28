let
  flakeLock = builtins.fromJSON (builtins.readFile ./flake.lock);
  nixpkgsRev = flakeLock.nodes.nixpkgs.locked.rev;
  lockedNixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/${nixpkgsRev}.tar.gz") { };
in
{ pkgs ? lockedNixpkgs }:
let
  bwB2Item = "backblaze.com";
  b2KeyId = "0035814e69b653f0000000002";
  b2ApplicationKey = "$(${pkgs.bitwarden-cli}/bin/bw get item ${bwB2Item} | ${pkgs.jq}/bin/jq '.fields[] | select(.name==\"terraform key id ${b2KeyId}\") | .value')";

  terraform = pkgs.writers.writeBashBin "terraform" ''
    case $1 in
      fmt)
          ;;
      *)
          export B2_APPLICATION_KEY_ID="${b2KeyId}";
          export B2_APPLICATION_KEY="${b2ApplicationKey}";
          ;;
    esac
          ${pkgs.terraform}/bin/terraform "$@"
  '';
in
pkgs.mkShell {
  name = "infra-shell";
  nativeBuildInputs = with pkgs;[
    nil
    nixpkgs-fmt
    ansible-lint
    yaml-language-server
    terraform-ls

    bitwarden-cli
    jq

    ansible

    terraform

    earthly
  ];
}
