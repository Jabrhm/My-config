{ config, pkgs, inputs, lib, ... }:
let
  tex = (pkgs.texliveBasic.withPackages (
    ps: with ps; [
      scheme-full 
      pspicture
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
    pkgs.pavucontrol
    pkgs.tor-browser
  
    # Useless things
    pkgs.unstable.discord
    pkgs.unstable.discordo

    # Cute things
    pkgs.unstable.btop
    pkgs.cava
    pkgs.unstable.fastfetch
    pkgs.htop-vim
    pkgs.jp2a
    pkgs.kittysay
    pkgs.mpvpaper
    pkgs.sl 
    pkgs.tty-clock 
    pkgs.unimatrix

    # College 
    pkgs.zathura
    tex 
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    extraPackages = with pkgs; [
      sudo 
    ];
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;

    extraPackages = epkgs: [
      epkgs.auctex
      epkgs.company
      epkgs.diredc
      epkgs.enlight
      epkgs.evil
      epkgs.flycheck
      epkgs.lsp-mode
      epkgs.lsp-treemacs
      epkgs.magit
      epkgs.marginalia
      epkgs.nix-mode
      epkgs.orderless
      epkgs.org-view-mode
      epkgs.proof-general
      epkgs.treemacs-nerd-icons
      epkgs.undo-tree
      epkgs.vertico
    ];

    extraConfig = ''
      (load "~/.config/emacs/Modules/gui.el");
      (load "~/.config/emacs/Modules/pConfig.el")
      (load "~/.config/emacs/Modules/theme.el")'';
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
      backgroun_blur 1
    '';
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nix, btw";
      brights = "brightnessctl s";
      nix-edit = "emacs ~/nixConf/configuration.nix";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixConf";
      nix-test = "sudo nixos-rebuild test --flake ~/nixConf";
      nix-boot = "sudo nixos-rebuild boot --flake ~/nixConf";
      nix-emacs = "nix-shell ~/.config/emacs";
      sld = "sl";
      vim = "emacs -nw";
    };
  };
}
