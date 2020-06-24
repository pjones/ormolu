let
  rev = "1357624fa9edff4add4c535c0606eb673f29966f";
  sha256 = "0pgzh7xw9gp50akh7yzvyai68ph22jaf1lq4a5pvhq3g15pxga0m";
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  };
  pkgs = import nixpkgs { config.allowUnfree = true; };
in
pkgs
