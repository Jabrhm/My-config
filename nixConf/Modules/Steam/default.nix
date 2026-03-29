{
  pkgs,
  ...
}:

{
  config = {
    programs = {
      steam = {
        enable = true;
        protontricks.enable = true;
        gamescopeSession.enable = true;
      };
      gamemode.enable = true;
    };

    # Graphic drivers 
    services.xserver.videoDrivers = [ "radeon" ];
    
    environment.systemPackages = with pkgs; [
      pkgs.lm_sensors
      pkgs.mangohud
      pkgs.protonup-ng 
    ];
  };
}
