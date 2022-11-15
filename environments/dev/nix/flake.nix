{
  description = "A Konrad's home flake";
  # original idea https://gist.github.com/suhr/4bb1f8434d0622588b23f9fe13e79973
  # https://gist.github.com/lheckemann/402e61e8e53f136f239ecd8c17ab1deb

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        unstable = import nixpkgs-unstable { "system" = system; };
        stable = import nixpkgs { "system" = system; };
        legacy = nixpkgs.legacyPackages.${system};
      in
      {
        defaultPackage = stable.buildEnv {
          name = "konrad-home-env";
          paths = [
            unstable.nix-direnv
          ];
        };
      });
}
