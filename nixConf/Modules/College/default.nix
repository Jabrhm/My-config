{
  config,
  pkgs,
  inputs,
  ...
}:

{
  config = {
    # My hp printer\scanner 
    services.printing.enable = true;
    services.printing.drivers = [ pkgs.hplip ];
    
    hardware.sane.enable = true;
    hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ]; 
    
    # Programs
    programs = {
      thunderbird = {
        enable = true;
        package = pkgs.unstable.thunderbird;
      };
      kdeconnect.enable = true;
      
      # Fuck nano
      nano.enable = false;
    };
    
    # LSP thing
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    environment.systemPackages = with pkgs; [
      # LSPs
      pkgs.unstable.clang-tools 
      pkgs.unstable.texlab 
      pkgs.unstable.nixd

      # For the USB where I have my TeX files 
      pkgs.cryptsetup
    ];
  };
}
