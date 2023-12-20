{
  description = "konradmalik infra";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
          (system:
            function (import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }));
    in
    {
      devShells = forAllSystems
        (pkgs:
          with pkgs;
          {
            default = pkgs.mkShell
              {
                name = "infra";
                packages = with pkgs;[
                  # linters, formatters
                  ansible-lint
                  # useful tools
                  jq
                  #
                  ansible
                  awscli2
                  bitwarden-cli
                  earthly
                  terraform
                ];
              };
          });

      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);
    };
}
