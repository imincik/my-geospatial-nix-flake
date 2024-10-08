{
  description = "My Geospatial Flake";

  nixConfig = {
    extra-substituters = [
      "https://geonix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "geonix.cachix.org-1:iyhIXkDLYLXbMhL3X3qOLBtRF8HEyAbhPXjjPeYsCl0="
    ];
  };

  inputs = {
    geonix.url = "github:imincik/geospatial-nix";

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "geonix/nixpkgs";
    };

    nixpkgs.follows = "geonix/nixpkgs";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [ "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {

        # packages
        packages =
          let
            geopkgs = inputs.geonix.packages.${system};
          in

          {
            qgis = (inputs.geonix.packages.${system}.qgis.override {
              extraPythonPackages = p: [
                pkgs.python3Packages.flask
                geopkgs.python3-fiona
              ];
            });

            nixGLIntel = inputs.nixgl.packages.${system}.nixGLIntel;
          };

        # shell environments
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with self'.packages; [
            qgis
            nixGLIntel
          ];
        };
      };

      flake = { };
    };
}
