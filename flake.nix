{
  description = "konradmalik infra";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default =
          let
            bwB2Item = "backblaze.com";
            b2KeyId = "0035814e69b653f0000000002";
            b2ApplicationKey = "$(${pkgs.bitwarden-cli}/bin/bw get item ${bwB2Item} | ${pkgs.jq}/bin/jq --raw-output '.fields[] | select(.name==\"terraform key id ${b2KeyId}\") | .value')";
            cfItem = "ae442c84-d055-441a-b761-ae5a00a28a7a";
            cfEmail = "konrad.malik@gmail.com";
            cfApiKey = "$(${pkgs.bitwarden-cli}/bin/bw get item ${cfItem} | ${pkgs.jq}/bin/jq --raw-output '.fields[] | select(.name==\"api key\") | .value')";

            terraform = pkgs.writers.writeBashBin "terraform" ''
              case $1 in
                fmt)
                    ;;
                *)
                    export B2_APPLICATION_KEY_ID="${b2KeyId}";
                    export B2_APPLICATION_KEY="${b2ApplicationKey}";
                    export CLOUDFLARE_EMAIL=${cfEmail};
                    export CLOUDFLARE_API_KEY=${cfApiKey};
                    ;;
              esac
                    ${pkgs.terraform}/bin/terraform "$@"
            '';
          in
          pkgs.mkShell
            {
              name = "infra-shell";
              packages = with pkgs;[
                # linters, formatters
                nixpkgs-fmt
                ansible-lint
                # lanuage servers
                nil
                yaml-language-server
                terraform-ls
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
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
