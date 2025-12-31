{ config, pkgs, inputs, lib, ... }:
let
  tex = (pkgs.texliveBasic.withPackages (
    ps: with ps; [
      scheme-full 
      pspicture
    ]));
in
{
  home.username = "abraham";
  home.homeDirectory = "/home/abraham";

  home.stateVersion = "25.11"; 

  home.packages = [
    # Cute things
    pkgs.cava
    pkgs.cmatrix
    pkgs.htop-vim
    pkgs.kittysay
    pkgs.lsd 
    pkgs.ranger 
    pkgs.sl 
    pkgs.tty-clock 

    # College 
    pkgs.wxhexeditor
    pkgs.zathura
    tex 
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nix, btw";
      nix-rebuild = "sudo nixos-rebuild switch --flake ~/nixConf";
      vi = "emacs -nw";
      vim = "emacs -nw";
      nvim = "emacs -nw";
      ssha = "ssh abraham@dematoso";
    };
  };
}
