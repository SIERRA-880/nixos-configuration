{ pkgs, config, ... }:

{
 # wayland.windowManager.hyprland = {
 #    settings = {
 #      bind = [ "$mainMod, Return, exec, kitty" ];
 #    };
 #  };

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    themeFile = "gruvbox-dark-soft";
    settings = {
      confirm_os_window_close = 0;
      copy_on_select = "yes";
      editor = "nvim";
    };
  };
}
