{ config, pkgs, ...}:

{
  imports = [
    ./config/hyprland.nix
    ./config/waybar.nix
  ];

  home.username = "ugo";
  home.homeDirectory = "/home/ugo";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    bat
    brightnessctl
    firefox
    freecad
    gparted
    logseq
    openscad
    prusa-slicer
    pw-volume
    signal-desktop
    trash-cli
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls="ls -lah";
    };
  };
}
