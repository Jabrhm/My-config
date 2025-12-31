{ pkgs, ... }:
let
  HatsuneMiku = pkgs.stdenv.mkDerivation {
    pname = "HatsuneMiku";
    version = "master";
    
    src = pkgs.fetchFromGitHub {
      owner = "yorunoken";
      repo = "HatsuneMiku";
      rev = "72735faca036d7e129cb7d2181b3d18b90eaf069";
      hash = "sha256-2k7EhZSB8UHOdgNzS39YU+lmMg4ub7ahJfBU8r7ZhBU=";
    };
      
    installPhase = ''
    mkdir -p $out
    cp -r $src/1080-HatsuneMiku/* $out/'';
  };
in
{
  config.boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      efiInstallAsRemovable = true;
      theme = "${HatsuneMiku}";
    };
  };
}
