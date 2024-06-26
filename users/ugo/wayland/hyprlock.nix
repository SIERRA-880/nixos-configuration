{inputs, config, ...}:

{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [ "$mainMod , L, exec, hyprlock" ];
    };
  };

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
      };

      background = [
      {
        monitor = "";
        path = "screenshot";
        blur_passes = 1;
      }
      ];

      input-field = [
      {
        size = {
          width = 400;
          height = 50;
        };

        outline_thickness = 2;

        fade_on_empty = false;

        dots_spacing = 0.3;
        dots_center = true;

        outer_color = "rgb(${config.colorScheme.palette.base00})";
        inner_color = "rgb(${config.colorScheme.palette.base01})";
        font_color = "rgb(${config.colorScheme.palette.base06})";

        placeholder_text = "";

        check_color = "rgb(${config.colorScheme.palette.base0B})";
        fail_color = "rgb(${config.colorScheme.palette.base08})";
      }
      ];

      label = [
      {
        monitor = "eDP-1";
        text = "$TIME";
        font_size = 50;
        color = "rgb(${config.colorScheme.palette.base06})";

        position = {
          x = 0;
          y = 0;
        };

        valign = "center";
        halign = "center";
      }
      # {
      #   monitor = "HDMI-A-1";
      #   text = "$TIME";
      #   font_size = 50;
      #   color = "rgb(${config.colorScheme.palette.base06})";
      #
      #   position = {
      #     x = 0;
      #     y = 80;
      #   };
      #
      #   valign = "center";
      #   halign = "center";
      # }
      ];
    };
  };
}
