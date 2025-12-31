{
  description = "Battery saving flake";

  outputs = inputs: {
    nixosModules.default = ./default.nix;
  };
}
