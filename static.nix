{ pkgs ? (import ./nix/nixpkgs)
, ormoluCompiler ? "ghc883"
}:
let
  nix-hs = import
    (fetchGit {
      url = "https://github.com/pjones/nix-hs.git";
      rev = "afca362fa008d9da9fb48cdf7c4f5b1a70edcbba";
    })
    { inherit pkgs; };

in
nix-hs {
  cabal = ./ormolu.cabal;
  compiler = ormoluCompiler;
  enableFullyStaticExecutables = true;

  overrides = lib: self: super: with lib; {
    "ghc-lib-parser" = dontHaddock
      (super.callHackageDirect
        {
          pkg = "ghc-lib-parser";
          ver = "8.10.1.20200412";
          sha256 = "sha256-EjMzp8xRT3xVFKDI1fAfopkylGB0hv35Av2+uZeETRU=";
        }
        { });
  };
}
