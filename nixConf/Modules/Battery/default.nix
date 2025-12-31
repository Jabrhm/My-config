{ pkgs, config, ... }:

{
  config.services = {
    upower = {
      enable = true;
      package = pkgs.upower;
      usePercentageForPolicy = true;
      percentageLow = 15;
      percentageCritical = 5;
    };


    tlp = {
      enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;
        
        # For battery life
        START_CHARGE_THRESH_BAT0 = 30;
        STOP_CHARGE_TRHESH_BAT0 = 90;
      };
    };
  };
}
