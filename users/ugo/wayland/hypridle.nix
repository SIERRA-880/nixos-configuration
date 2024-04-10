{inputs, config, lib, pkgs, ...}:

{
  imports = [ inputs.hypridle.homeManagerModules.default ];
  services.hypridle = {
    enable = true;

    listeners = [
      {
        timeout = 60;
        onTimeout = "${lib.getExe pkgs.hyprlock}";
        onResume = "echo 'I can use echo'";
      }
      {
        timeout = 120;
        onTimeout = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms off";
        onResume = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms on";
      }
    ];
  };
}
