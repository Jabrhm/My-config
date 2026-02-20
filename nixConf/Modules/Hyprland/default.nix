{
  config,
  pkgs,
  ...
}:

{
  config = {
    # Hyprland and cuates
    programs = {
      hyprland.enable = true;
      hyprlock.enable = true;
    };
    services.displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
    
    environment.systemPackages = with pkgs; [
      # Hyprland things
      pkgs.grimblast
      pkgs.hyprcursor 
      pkgs.hyprgraphics 
      pkgs.hyprpaper 
      pkgs.hyprpicker 
      pkgs.hyprtoolkit 
      
      # Useful stuff
      pkgs.waybar
      pkgs.waypaper
    ];
  };
}
