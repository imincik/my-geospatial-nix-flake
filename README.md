# My geospatial flake

* Run QGIS without installation
```
  nix run github:imincik/my-geospatial-nix-flake#nixGLIntel-- nix run github:imincik/my-geospatial-nix-flake#qgis
```

* Install QGIS with Flask (from nixpkgs) and Fiona (from geonix).
```
  nix profile install github:imincik/my-geospatial-nix-flake#qgis
  nix profile install github:imincik/my-geospatial-nix-flake#nixGLIntel

  nixGLIntel qgis
```

* Launch shell environment with QGIS and GPU drivers
```
  nix develop

  nixGLIntel qgis
```
