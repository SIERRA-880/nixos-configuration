{ config, pkgs, ... }:

let
    pkgs-hypr = import (builtins.fetchGit {
        name = "hyprland-0_41_2";
        url = "https://github.com/NixOS/nixpkgs/";
        ref = "refs/heads/nixpkgs-unstable";
        rev = "0c19708cf035f50d28eb4b2b8e7a79d4dc52f6bb";
    }) {inherit (pkgs) system;};

    hypr-0_41_2 = pkgs-hypr.hyprland;
in

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = hypr-0_41_2;

    settings = {
      # monitor=",preferred,auto,1,mirror, eDP-1";
      monitor = [
        ",preferred,auto,1"
        # "DP-4,preferred,1920x420,1"
        # "DP-3,preferred,0x0,1,transform,1"
      ];

      exec-once = [
        "waybar"
        # "sftpman mount_all"
      ];

      input = {
        kb_layout = "us";
        kb_options = "compose:ralt";

        accel_profile = "flat";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgba(${config.colorScheme.colors.base00}ff) rgba(${config.colorScheme.colors.base01}ff) 45deg";
        "col.inactive_border" = "rgba(${config.colorScheme.colors.base08}ff) rgba(${config.colorScheme.colors.base09}ff) 45deg";
        layout = "dwindle";
      };

      misc = {
        force_default_wallpaper = 0;
      };

      windowrule = [
        "float, wofi"
      ];

      decoration = {
        rounding  = 1;
        active_opacity = 1;
        inactive_opacity = 0.85;
      };

      animations = {
        enabled = true;
        bezier = [
          "pace, 0.46, 1, 0.29, 0.99"
          "overshot, 0.13, 0.99, 0.29, 1.1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
        ];
        animation = [
          "windowsIn, 1, 6, md3_decel, slide"
          "windowsOut, 1, 6, md3_decel, slide"
          "windowsMove, 1, 6, md3_decel, slide"
          "fade, 1, 10, md3_decel"
          "workspaces, 1, 7, md3_decel, slide"
          "specialWorkspace, 1, 8, md3_decel, slide"
          "border, 0, 3, md3_decel"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = { new_status = "master"; };

      gestures = { workspace_swipe = false; };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, Return, exec, wofi"

        "$mainMod, Space, exec, hyprctl dispatch togglefloating"

        ", XF86AudioRaiseVolume, exec, amixer sset Master 5%+"
        ", XF86AudioLowerVolume, exec, amixer sset Master 5%-"
        ", XF86AudioMute, exec, pw-volume mute toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", Print, exec, grim -g \"$(slurp -d)\" - | wl-copy --type image/png"
        "SHIFT, Print, exec, pushd ~/Downloads/ ; grim -g \"$(slurp -d)\" ; popd"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"

      ];

      bindl = [
        ",switch:on:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, disable\""
        ",switch:off:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, preffered, auto, 1\""
      ];
    };
  };
}
