{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = 
      ''
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=,preferred,auto,1
      # monitor=eDP-1,1920x1080,0x0
      # monitor=DP-2,1920x1080,1920x0
      
      # Execute your favorite apps at launch
      # exec-once = swaybg --image wallpaper.png -o*
      exec-once = hyprpaper
      exec-once = waybar 

      misc {
        # Remove ultra cringe anime wallpaper
        force_default_wallpaper = 0
      }
      
      # Window type
      windowrule = float, rofi
      
      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
	  kb_layout = us 
	  kb_options = compose:ralt
	  kb_variant =
	  kb_model =
	  kb_rules =
	  accel_profile = flat
      
	  follow_mouse = 1
      
	  touchpad {
	      natural_scroll = yes
	  }
      
	  sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      
      general {
	  # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
	  gaps_in = 5
	  gaps_out = 10
	  border_size = 2
	  col.active_border = rgba(0000ffff) rgba(ffffffff) 45deg
	  col.inactive_border = rgba(ff0000ff) rgba(ffffffff) 45deg
      
	  layout = dwindle
      }
      
      decoration {
	  # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
	  rounding = 1
	  active_opacity = 1
	  inactive_opacity = 0.85
      
	  drop_shadow = yes
	  shadow_range = 4
	  shadow_render_power = 3
	  col.shadow = rgba(1a1a1aee)
      }
      
      animations {
	  enabled = yes
	  #bezier = myBezier, 0.13, 0.99, 0.29, 1.1
	  #animation = windows, 1, 7, myBezier, slide
	  #animation = windowsOut, 1, 7, default, popin 80%
	  #animation = border, 1, 10, default
	  #animation = fade, 1, 7, default
	  #animation = workspaces, 1, 6, myBezier, slide
      
	  bezier=pace,0.46, 1, 0.29, 0.99
	  bezier=overshot,0.13,0.99,0.29,1.1
	  bezier = md3_decel, 0.05, 0.7, 0.1, 1
	  animation=windowsIn,1,6,md3_decel,slide
	  animation=windowsOut,1,6,md3_decel,slide
	  animation=windowsMove,1,6,md3_decel,slide
	  animation=fade,1,10,md3_decel
	  animation=workspaces,1,7,md3_decel,slide
	  animation=specialWorkspace,1,8,md3_decel,slide
	  animation=border,0,3,md3_decel
      
      }
      
      dwindle {
	  # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
	  pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
	  preserve_split = yes # you probably want this
      }
      
      master {
	  # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
	  new_is_master = true
      }
      
      gestures {
	  # See https://wiki.hyprland.org/Configuring/Variables/ for more
	  workspace_swipe = off
      }
      
      # https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER
      
      # bind = $mainMod, L, exec, hyprlock

      # Binds, https://wiki.hyprland.org/Configuring/Binds/
      bind = $mainMod, M, exit
      bind = $mainMod, Q, killactive
      bind = $mainMod, F, fullscreen
      # bind = $mainMod, Return, exec, wofi --show drun -Dkey_expand=Tab
      bind = $mainMod, Return, exec, wofi
      bind = , Print, exec, grim -g "$(slurp -d)"
     
      # Volume control
      bind = , XF86AudioRaiseVolume, exec, amixer sset Master 5%+
      bind = , XF86AudioLowerVolume, exec, amixer sset Master 5%-
      bind = , XF86AudioMute, exec, pw-volume mute toggle
      
      bind = , XF86MonBrightnessUp, exec, brightnessctl set +10%
      bind = , XF86MonBrightnessDown, exec, brightnessctl set 10%-
      
      # Move focus with mainMod + arrow keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d
      
      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
     
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      '';
  };
}
