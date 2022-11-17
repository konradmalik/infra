{
  description = "Konrad's home flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            unstable-overlay
            unstable-legacy-overlay
            legacy-overlay
          ];
        };

        unstable-overlay = final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.system;
          };
        };
        unstable-legacy-overlay = final: prev: {
          unstable-legacy = nixpkgs-unstable.legacyPackages.${prev.system};
        };
        legacy-overlay = final: prev: {
          legacy = nixpkgs.legacyPackages.${prev.system};
        };
        # can be here as it's not really system dependent
        # if ever becomes that - we can move it to outputs and refer to it as 'self.profileExports.${system}'
        profileExports = pkgs.writeText "profile-exports" ''
          export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
          export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info
        '';
      in
      {
        packages.default = pkgs.buildEnv {
          name = "konrad-home-env";
          paths = [
            (pkgs.runCommand "profile" { } ''
              mkdir -p $out/etc/profile.d
              cp ${profileExports} $out/etc/profile.d/profile-exports.sh
            '')

            pkgs.unstable.direnv
            pkgs.unstable.nix-direnv
          ];
          pathsToLink = [ "/share" "/bin" "/etc" ];
          extraOutputsToInstall = [ "man" "doc" "info" ];
          postBuild = ''
            if [ -x $out/bin/install-info -a -w $out/share/info ]; then
              shopt -s nullglob
              for i in $out/share/info/*.info $out/share/info/*.info.gz; do
                  $out/bin/install-info $i $out/share/info/dir
              done
            fi
          '';
        };
      });
}
