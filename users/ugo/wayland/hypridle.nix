{
  # screen idle
  services.hypridle = {
    enable = true;

    listeners = [
      {
        timeout = 5;
        onTimeout = "hyprlock";
      }
      {
        timeout = 10;
        onTimeout = "hyprctl dispatch dpms off";
        onResume = "hyprctl dispatch dpms on";
      }
    ];
  };
}