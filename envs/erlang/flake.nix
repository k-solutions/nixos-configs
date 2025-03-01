{
  description = "Development environment Erlang";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
   flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs { inherit system; };

        erlang = pkgs.beam.packages.erlang.erlang;
        erlang-ls = pkgs.beam.packages.erlang.erlang-ls;
        erlfmt = pkgs.beam.packages.erlang.erlfmt;
        locales = pkgs.glibcLocales;
        rebar3 = pkgs.rebar3;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            erlang
            erlang-ls
            erlfmt 
            locales
            rebar3
          ];
        };
      });
}
