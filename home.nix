{ config, pkgs, ... }: let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;

in {
  imports = [
    hyprland.homeManagerModules.default
    ./config/hyprland.nix
    ./config/waybar.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "ugo";
  home.homeDirectory = "/home/ugo";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    brightnessctl
    ranger
    caprine-bin
    obsidian
    cura
    prusa-slicer
    freecad
    openscad
    freetube
  ];

  programs.chromium.enable = true;

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    settings = { ignorecase = true; number = true; };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };
}
