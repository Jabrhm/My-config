{ config, pkgs, lib, inputs, ... }:

{
    imports =
    [ 
      ./hardware-configuration.nix
    ];
  
  system.nixos.label = "Hyprland_and_flakes";

  # Automatic cleanup
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 10d";
  };

  nix.settings.auto-optimise-store = true;

  # Profile  
  networking.hostName = "dematoso"; 

  # Enable networking
  networking.networkmanager.enable = true;
   
  # Set your time zone.
  time.timeZone = "America/Mexico_City";
  
  # Hyprland 
  programs = {
    hyprland.enable = true;
    waybar.enable = true;
    hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
    };
  };
  
  services.displayManager.sddm.wayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
 
  # Configure console keymap
  console.keyMap = "la-latin1";

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
    };
  };
  services.blueman.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];

  # SANE for scanning
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ]; 

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account.
  users.users.abraham = {
    isNormalUser = true;
    description = "Abraham";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
  };

  # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.hack ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # ¬Enable nano
  programs.nano.enable = false;

  # Steam
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  programs.steam.gamescopeSession.enable = true;
  services.xserver.videoDrivers = [ "radeon" ];
  programs.gamemode.enable = true;
  
  # Thunderbird 
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;
  };
  services.protonmail-bridge.enable = true;

  # Xbox controller
  hardware = {
    xpadneo.enable = true;
    xone.enable = true;
  };

  # My GNU Emacs override
  nixpkgs.config.packageOverrides = pkgs: rec {
    myEmacs = pkgs.emacs.pkgs.withPackages (epkgs: with epkgs; [
      auctex 
      company 
      evil 
      flycheck 
      ivy 
      lsp-mode
      lsp-treemacs 
      nix-mode
      org-view-mode
      proof-general 
      treemacs-nerd-icons
      undo-tree  
    ]);
  };

  # Packages in the system
  environment.systemPackages = with pkgs; [

  #Fundamental
  git
  kitty
  myEmacs
  pkgs.librewolf
  
  # Useful things
  pkgs.brightnessctl 
  pkgs.gimp
  pkgs.lsd 
  pkgs.nurl
  pkgs.pavucontrol
  pkgs.tor-browser

  # Code
  pkgs.gcc_multi
  pkgs.nixd

  # Just in case
  pkgs.inkscape-with-extensions 
  pkgs.pinta 

  # Cute things
  pkgs.fastfetch  
  pkgs.hyprcursor
  pkgs.hyprgraphics
  pkgs.hyprpaper
  pkgs.hyprpicker
  
  # Useful stuff
  pkgs.discord 
  pkgs.grimblast 
  pkgs.hyprlauncher
  pkgs.waytrogen 
  
  # Gaming 
  pkgs.linuxKernel.packages.linux_zen.xone  
  pkgs.linuxKernel.packages.linux_zen.xpadneo  
  pkgs.mangohud
  pkgs.protonup-ng
   ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  
  # GNU Emacs
  services.emacs = {
    enable = true;
    package = pkgs.myEmacs;
    defaultEditor = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  # Enable GNUPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "25.05"; 
}
