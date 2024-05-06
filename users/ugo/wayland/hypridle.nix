{inputs, config, lib, pkgs, ...}:

{
  # imports = [ inputs.hypridle.homeManagerModules.default ];
  services.hypridle = {
    enable = true;

    settings = {
      listeners = [
        {
          timeout = 300;
          onTimeout = "${lib.getExe pkgs.hyprlock}";
          onResume = "echo 'I can use echo'";
        }
        {
          timeout = 600;
          onTimeout = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms off";
          onResume = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms on";
        }
      ];
    };
  };
}
