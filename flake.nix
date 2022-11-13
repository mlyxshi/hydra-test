{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
    in
    {
      hydraJobs."tree" = pkgs.tree;
      hydraJobs."text" = pkgs.runCommand "readme" { } ''
        echo hello world
        mkdir -p $out/
        echo "Hello world" > $out/readme
      '';
    };

}
