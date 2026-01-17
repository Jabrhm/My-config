{ config, lib, pkgs, inputs, ... }:
let
  tex = (pkgs.texliveBasic.withPackages (
    ps: with ps; [
      scheme-full 
      pspicture
    ]));
in
{
  imports = [
  ];

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
    tex 
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      brights = "brightnessctl s";
      nix-boot = "sudo nixos-rebuild boot --flake ~/nixConf";
      nix-edit = "emacs ~/nixConf/configuration.nix";
      nix-emacs = "nix-shell ~/.config/emacs";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixConf";
      nix-test = "sudo nixos-rebuild test --flake ~/nixConf";
      nix-update = "sudo nix flake update --flake ~/nixConf";
      sld = "sl";
      vim = "emacs -nw";
    };
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;

    extraPackages = epkgs: [
      epkgs.auctex
      epkgs.autotetris-mode
      epkgs.ccls
      epkgs.company
      epkgs.nerd-icons-dired
      epkgs.evil
      epkgs.flycheck
      epkgs.latex-math-preview
      epkgs.lsp-mode
      epkgs.lsp-treemacs
      epkgs.magit
      epkgs.marginalia
      epkgs.nix-mode
      epkgs.orderless
      epkgs.proof-general
      epkgs.treemacs-nerd-icons
      epkgs.undo-tree
      epkgs.vertico
    ];

    extraConfig = ''
      (load "~/.config/emacs/Modules/gui.el");
      (load "~/.config/emacs/Modules/pConfig.el")
      (load "~/.config/emacs/Modules/keybinds.el")
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

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zathura = {
    enable = true;
    package = pkgs.unstable.zathura;
  };
}
