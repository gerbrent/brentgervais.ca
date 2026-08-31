{
  description = "brentgervais.ca landing page";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell { packages = [ pkgs.zola ]; };
        });

      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.stdenv.mkDerivation {
            pname = "brentgervais-site";
            version = "0.1.0";
            src = self;
            nativeBuildInputs = [ pkgs.zola ];
            buildPhase = "zola build";
            installPhase = "mkdir -p $out && cp -r public/* $out/";
          };
        });
    };
}