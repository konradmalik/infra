{
  description = "Konrad's home flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            konrad-overlay
          ];
        };

        konrad-overlay = final: prev: {
          konrad = final.callPackage ./. { };
        };

      in
      {
        packages.default = pkgs.konrad.home;

        formatter = pkgs.nixpkgs-fmt;
      });
}
