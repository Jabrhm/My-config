{
  description = "Flake for Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
   inputs@{
     nixpkgs,
     nixpkgs-unstable,
     home-manager,
     ...
   }:
   let
     system = "x86_64-linux";

     overlay-unstable = final: prev: {
       unstable = import nixpkgs-unstable {
         system = prev.stdenv.hostPlatform.system;
         config.allowUnfree = true;
       };
     };
   in
   {
     nixosConfigurations = {
       dematoso = nixpkgs.lib.nixosSystem {
         inherit system;
         specialArgs = {
           inherit inputs;
         };
         
         modules = [
           ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
           ./configuration.nix
           
           home-manager.nixosModules.home-manager
           {
             home-manager = {
               useGlobalPkgs= true;
               useUserPackages = true;
               users."abraham" = ./home.nix;
               backupFileExtension = "backup";
             };
           }
         ];
       };
     };

     homeConfigurations."abraham" = home-manager.lib.homeManagerConfiguration {
       modules = [
         ./home.nix
       ];
       extraSpecialArgs = { inherit inputs; };
     };
   };
}
