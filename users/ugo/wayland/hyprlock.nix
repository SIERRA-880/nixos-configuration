{inputs, ...}:

{
  imports = [ inputs.hyprlock.homeManagerModules.default ];
  programs.hyprlock = {
    enable = true;

    input-fields = [
      {
        monitor = "eDP-1";

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
