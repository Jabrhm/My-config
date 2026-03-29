{
  config,
  inputs,
  pkgs,
  ...
}:

{
  config.programs.silentSDDM = {
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
      "LoginScreen.LoginArea.Spinner" = {
        color = "#140a1d";
        text = "Dead to capitalism :3";
      };
      "LoginScreen.LoginArea.Username" = {
        color = "#140a1d";
      };
      "LoginScreen.MenuArea.Power" = {
        content-color = "#140a1d";
      };
      "LoginScreen.MenuArea.Keyboard" = {
        content-color = "#140a1d";
      };
      "LoginScreen.MenuArea.Layout" = {
        content-color = "#140a1d";
        };
      "LoginScreen.MenuArea.Session" = {
        content-color = "#140a1d";
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
}

