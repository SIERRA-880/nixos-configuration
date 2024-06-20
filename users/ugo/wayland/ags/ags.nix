{inputs, pkgs, ...}:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # configDir = ./config/config.js;
    configDir = builtins.toPath "${./config}";
  };
}
