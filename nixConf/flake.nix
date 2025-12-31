{
  description = "Flake for Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    battery.url = "path:./Modules/Battery";
    miku-grub.url = "path:./Modules/Miku-Grub";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
   inputs@{
     nixpkgs,
     home-manager,
     battery,
     miku-grub,
     ...
    }: {
    nixosConfigurations = {
      dematoso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        
        modules = [
          ./configuration.nix
          battery.nixosModules.default
          miku-grub.nixosModules.default
          
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
  };
}
