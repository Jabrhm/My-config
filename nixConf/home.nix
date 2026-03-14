{
  pkgs,
  ...
}:
let
  texlive-override = (pkgs.texliveBasic.withPackages (
    ps: with ps; [
      scheme-full 
      pspicture
    ]));

  miku-hyprcursor = pkgs.stdenv.mkDerivation {
    pname = "miku-cursor-linux-hyprcursor";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "BlockHaity";
      repo = "miku-cursor-linux-hyprcursor";
      rev = "7edcbeb9a401f20056357c6cc45fe7cea4016074";
      hash = "sha256-Ao+XNWLcCJWMSJ8FNc2JYS1hhMViwo4iRsHfK+MeVMc=";
    };
    
    installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/miku-cursor-linux-hyprcursor
    cp -R . $out/share/icons/miku-cursor-linux-hyprcursor/
    runHook postInstall
  '';
  };

  aspell-override = (pkgs.aspellWithDicts (dicts: with dicts; [
    en
    en-science
    en-computers
    es
  ]));
in
{
  home = {
    username = "abraham";
    homeDirectory = "/home/abraham";
    stateVersion = "25.11";
  };
  
  programs.home-manager.enable = true;

  home.packages = [
    # Useful things
    pkgs.unstable.gimp
    pkgs.unstable.nurl
    pkgs.tor-browser
    pkgs.pamixer
    pkgs.pavucontrol
  
    # Useless things
    pkgs.unstable.discord

    # Cute things
    pkgs.unstable.fastfetch
    pkgs.cava
    pkgs.kittysay
    pkgs.mpvpaper
    pkgs.sl 
    pkgs.tty-clock 
    pkgs.unimatrix
    miku-hyprcursor

    # College 
    aspell-override
    texlive-override 
    pkgs.zip
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      brights = "brightnessctl s";
      nix-rebuild = "sudo nixos-rebuild --flake ~/nixConf/";
      nix-update = "sudo nix flake update --flake ~/nixConf/";
      sld = "sl";
      NyE = "echo 'uuuuhhjjj me recuerda ami infancia cundo estaba en el quinder y ise una obra jaaaaaaaaaa que risa cepillin con tus payasadas eres un naco y estupido'";
    };
  };

  # Multimedia
  programs = {
    obs-studio.enable = true;
    mpv = {
      enable = true;
    };
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;

    extraPackages = epkgs: [
      epkgs.auctex
      epkgs.autotetris-mode
      epkgs.company
      epkgs.nerd-icons-dired
      epkgs.evil
      epkgs.flycheck
      epkgs.flyspell-correct
      epkgs.lsp-mode
      epkgs.lsp-treemacs
      epkgs.magit
      epkgs.marginalia
      epkgs.nix-mode
      epkgs.orderless
      epkgs.proof-general
      epkgs.undo-tree
      epkgs.vertico 
    ];

    extraConfig = ''
      (load "~/.config/emacs/Modules/gui.el")
      (load "~/.config/emacs/Modules/auctex.el")
      (load "~/.config/emacs/Modules/modes.el")
      (load "~/.config/emacs/Modules/orderless.el")
      (load "~/.config/emacs/Modules/evil.el")
      (load "~/.config/emacs/Modules/theme.el")
      (load "~/.config/emacs/Modules/keybinds.el")
      (setq ispell-dictionary "es")'';
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Hack Nerd Font";
      size = 15;
    };
    
    themeFile = "shadotheme";
    shellIntegration.enableBashIntegration = true;
    extraConfig = ''
      background_opacity 0.4
      backgroun_blur 2
      mouse_hide_wait 1.5
      cursor_shape block
      cursor_stop_blicking_after 10.0
    '';
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zathura = {
    enable = true;
    package = pkgs.unstable.zathura;
  };

  programs.rofi = {
    enable = true;
    configPath = "~/.config/rofi/config.rasi";
  };

  programs.gcc = {
    enable = true;
    package = pkgs.unstable.gcc;
  };

  programs.btop = {
    enable = true;
    package = pkgs.unstable.btop;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
      vim_keys = true;
      update_ms = 500;
    };
  };
  
  gtk = {
    enable = true;
    colorScheme = "dark";
    cursorTheme = {
      name = "miku-cursor-linux"; 
      size = 48;
    };
  };

  services.kdeconnect.enable = true;
}
