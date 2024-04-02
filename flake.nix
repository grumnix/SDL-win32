{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";

    SDL_src.url = "https://www.libsdl.org/release/SDL-1.2.15.tar.gz";
    SDL_src.flake = false;
  };

  outputs = { self, nixpkgs, tinycmmc, SDL_src }:
    tinycmmc.lib.eachWin32SystemWithPkgs (pkgs:
      {
        packages = rec {
          default = SDL;

          SDL = pkgs.stdenv.mkDerivation {
            pname = "SDL";
            version = "1.2.15";

            src = SDL_src;
          };
        };
      }
    );
}
