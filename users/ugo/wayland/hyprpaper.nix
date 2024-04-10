{inputs, config, ...}:

{
  imports = [ inputs.hyprpaper.homeManagerModules.default ];
  services.hyprpaper = {
    enable = true;
    preloads = [ "~/Documents/nixos-configuration/users/ugo/wayland/wallpaper.png" ];
    wallpapers = [ "eDP-1,~/Documents/nixos-configuration/users/ugo/wayland/wallpaper.png"
                   "DP-2,~/Documents/nixos-configuration/users/ugo/wayland/wallpaper.png" ];
    splash = false;
    ipc = false;
  };
}
