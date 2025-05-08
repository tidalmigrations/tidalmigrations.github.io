{
  description = "Jekyll blog development environment";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.ruby_3_4
              pkgs.rubyPackages_3_4.jekyll
            ];
            shellHook = ''
              export PKG_CONFIG_PATH=$PKG_CONFIG_PATH_FOR_TARGET;
              ruby -v
            '';
          };
        };
      });
}
