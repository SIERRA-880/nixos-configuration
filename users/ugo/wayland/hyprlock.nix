{inputs, ...}:

{
  imports = [ inputs.hyprlock.homeManagerModules.default ];

  # wayland.windowManager.hyprland = {
  #   settings = {
  #     bind = [ "$mainMod SHIFT, E, exec, hyprlock" ];
  #   };
  # };

  programs.hyprlock = {
    enable = true;

    general = {
      disable_loading_bar = true;
      grace = 5;
    };

    backgrounds = [
      {
        monitor = "";
        path = "screenshot";
        blur_passes = 3;
        vibrancy = 0.3;
      }
    ];

    input-fields = [
      {
        size = {
          width = 400;
          height = 50;
        };

        outline_thickness = 2;

        fade_on_empty = false;

        dots_spacing = 0.3;
        dots_center = true;
      }
    ];

    labels = [
      {
        monitor = "eDP-1";
        text = "$TIME";
        font_size = 50;
        color = "rgb(127, 127, 127)";

        position = {
          x = 0;
          y = 80;
        };

        valign = "center";
        halign = "center";
      }
    ];
  };
}
