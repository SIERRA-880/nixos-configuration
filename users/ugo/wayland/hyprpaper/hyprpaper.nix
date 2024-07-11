{inputs, config, ...}:

{
  # imports = [ inputs.hyprpaper.homeManagerModules.default ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${./wallpaper.jpg}" ];
      wallpaper = [ "eDP-1,${./wallpaper.jpg}" "HDMI-A-1,${./wallpaper.jpg}" ];
      splash = false;
      ipc = true;
    };
  };
}
