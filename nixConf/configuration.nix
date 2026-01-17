{ pkgs, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./Modules/Miku-Grub/default.nix
    ./Modules/Battery/default.nix
    inputs.silentSDDM.nixosModules.default
  ];
  
  system.nixos.label = "Hypr_and_cuates";

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
   
  # Set your time zone
  time.timeZone = "America/Mexico_City";
  
  # Hyprland y cuates
  programs = {
    hyprland.enable = true;
    hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
    };
  };
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
 
  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];

  # SANE for scaing
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
    package = pkgs.unstable.thunderbird;
  };

 # Packages in the system
  environment.systemPackages = with pkgs; [

  #Fundamental
  git
  kitty
  pkgs.brightnessctl 
  pkgs.grimblast
  pkgs.librewolf
  pkgs.lsd 

  # Code
  pkgs.unstable.libgcc
  pkgs.unstable.texlab 
  pkgs.unstable.nixd 

  # Graphical things
  pkgs.unstable.fastfetch 
  pkgs.hyprcursor 
  pkgs.hyprgraphics 
  pkgs.hyprpaper pkgs.hyprpicker 
  pkgs.hyprtoolkit 
  
  # Useful stuff
  pkgs.hyprlauncher
  pkgs.waybar
  pkgs.waypaper
  
  # Gaming 
  pkgs.lm_sensors
  pkgs.mangohud
  pkgs.protonup-ng
   ];

 nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

 # SDDM Theme 
 programs.silentSDDM = {
   enable = true;
   theme = "rei";

   profileIcons = {
     abraham = pkgs.fetchurl {
       name = "icon";
       url = "https://cdn.donmai.us/original/dc/ab/__nana_vocaloid_and_1_more_drawn_by_nou_nounknown__dcabacfdc153f2021a6361f0e176cf1c.jpg";
       hash = "sha256-NtHL40CWIN8wOFl1rXw9kyvT/5y5Ai1aNGyOYV9lRTo=";
     };
   };

   backgrounds = {
     cherry-miku = pkgs.fetchurl {
       name = "cherry-miku";
       url = "https://konachan.com/sample/42e1f547a3358a15c672104d0f77249c/Konachan.com%20-%20388189%20sample.jpg";
       hash = "sha256-taBr7xIbC3W8ystcyv2+Io5H1GSV4itdfRNViXpGLKw=";
     };

     pink-miku = pkgs.fetchurl {
       name = "pink-miku";
       url = "https://konachan.net/sample/570b88aa27c46500b068ba765db6c34f/Konachan.com%20-%20391747%20sample.jpg";
       hash = "sha256-TtGL6ZBBnxCikkzOxC6YXV3kOGxxt2ZBlTMLx6yy7hs=";
     };
   };

   settings = {
     # Login screen settings
     "LoginScreen" = {
       background = "pink-miku";
     };
     "LoginScreen.LoginArea.Avatar" = {
       active-border-color = "#140a1d";
     };
     "LoginScreen.LoginArea.Username" = {
       color = "#140a1d";
     };
     "LoginScreen.LoginArea.PasswordInput" = {
       content-color = "#140a1d";
       border-color = "#140a1d";
     };

     # LockScreen settings
     "LockScreen" = {
       background = "pink-miku";
     };
   };
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
