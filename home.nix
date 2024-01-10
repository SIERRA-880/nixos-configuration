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
    chromium
    signal-desktop
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };
}
