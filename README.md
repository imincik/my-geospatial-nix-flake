# My geospatial flake

* Install QGIS with Flask (from nixpkgs) and Fiona (from geonix).
```
  nix profile install github:imincik/my-geospatial-nix-flake#qgis
```

* Run QGIS without installation
```
  nix run github:imincik/my-geospatial-nix-flake#qgis
```

* Launch shell environment with QGIS and GPU drivers
```
  nix develop

  nixGLIntel qgis
```
