{
  description = "Flake for Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
   inputs@{
      nixpkgs,
      nixpkgs-unstable,
      self,
      ...
    }: {
        
    nixosConfigurations = {
      "dematoso" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
