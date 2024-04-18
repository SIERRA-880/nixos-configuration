{inputs, config, ...}:

{
  imports = [ inputs.hyprpaper.homeManagerModules.default ];
  services.hyprpaper = {
    enable = true;
    preloads = [ "~/Documents/nixos-configuration/users/ugo/wayland/wallpaper.jpg" ];
    wallpapers = [ "eDP-1,~/Documents/nixos-configuration/users/ugo/wayland/wallpaper.jpg"
                   "DP-2,~/Documents/nixos-configuration/users/ugo/wayland/wallpaper.jpg" ];
    splash = false;
    ipc = false;
  };
}
