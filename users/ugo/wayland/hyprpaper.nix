{inputs, ...}:

{
  imports = [ inputs.hyprpaper.homeManagerModules.default ];
  services.hyprpaper = {
    enable = true;
    preloads = [ "./wallpaper.png" ];
    wallpapers = [ "eDP-1, ./wallpaper.png" ];
    splash = false;
    ipc = false;
  };
}
