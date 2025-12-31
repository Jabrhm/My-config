{
  description = "Miku Theme for Grub";
  # If you are using Legacy Bios please change the default.nix file 

  outputs = inputs: {
    nixosModules.default = ./default.nix;
  };
}
