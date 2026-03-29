{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ 
    ./hardware-configuration.nix
    ./Modules/Battery/default.nix
    ./Modules/College/default.nix
    ./Modules/Hyprland/default.nix
    ./Modules/Miku-Grub/default.nix
    ./Modules/SDDM_Theme/default.nix
    ./Modules/Steam/default.nix
    inputs.silentSDDM.nixosModules.default 
  ];
  
  system.nixos.label = "Hypr_and_cuates";

  # Automatic cleanup
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
    settings.auto-optimise-store = true;
  };

  # Network
  networking = {
    hostName = "nix"; 
    networkmanager.enable = true;
    modemmanager.enable = true;
  };

  # Time Zone
  time.timeZone = "America/Mexico_City";
  
  # Keymap 
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  console.keyMap = "us";
 
  # Sound 
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User 
  users.users.abraham = {
    isNormalUser = true;
    description = "Abraham";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    pkgs.jetbrains-mono
  ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
 # Global Packages
  environment.systemPackages = with pkgs; [
    #Fundamental
    git
    kitty
    pkgs.brightnessctl 
    pkgs.librewolf
    pkgs.lsd 
  ];

 # SSH and GNUPG
 services.openssh.enable = true;
 programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
 };

 system.stateVersion = "25.05"; 
}
