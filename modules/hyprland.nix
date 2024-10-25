{ config, lib, pkgs, username,homeDir, ... }:

{
#  services.hypridle.enable = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, Return, exec, alacritty"
      "CTRL_ALT, Q, killactive,"
      "SUPER_ALT, Q, exit,"
      "$mainMod, S, togglefloating,"
      "$mainMod, D, exec, rofi -show drun -show-icons"
      "$mainMod, M, fullscreen"

      # Move focus
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      #swap windows
      "$mainMod SHIFT, h, swapwindow, l"
      "$mainMod SHIFT, l, swapwindow, r"
      "$mainMod SHIFT, k, swapwindow, u"
      "$mainMod SHIFT, j, swapwindow, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      #lock
      ", XF86Launch1, exec, hyprlock"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      " ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      " ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      " ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      " ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      " ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      " , XF86AudioNext, exec, playerctl next"
      " , XF86AudioPause, exec, playerctl play-pause"
      " , XF86AudioPlay, exec, playerctl play-pause"
      " , XF86AudioPrev, exec, playerctl previous"
    ];

    windowrulev2 = [
      #ignore maximize requests
      "suppressevent maximize, class:.*"
      #fix dragging issues with xwayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];

    input = {
      kb_layout = "fr";
      kb_variant = "us";
      follow_mouse = 2;
      touchpad.natural_scroll = false;
    };

    misc = {
      force_default_wallpaper = 1;
      disable_hyprland_logo = true;
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    animations = {
      enabled = true;

      bezier = [
	    "easeInOut, 0.77, 0, 0.175, 1"
        "easeOut, 0.24, 0.66, 0.04, 1"
	  ];
  
      animation = [
	    "windows, 1, 2, easeInOut"
  	    "windowsIn, 1, 2, easeInOut, slide"
        "windowsOut, 1, 2, easeInOut, slide"
        "fade, 1, 2, easeInOut"
        "workspaces, 1, 2, easeOut"
	  ];
    };

    decoration = {
      rounding = 10;
    
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    general = {
      gaps_in = 3;
      gaps_out = 7;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };

    env = [
	  "HYPRCURSOR_SIZE,17"
      "HYPRCURSOR_THEME,bibata-modern-classic"
    ];

	exec-once = [
      "swaybg -i ~/.config/nitrogen/wallpaper.png&"
      "(sleep 2;activate-linux)&"
      "waybar&"
      "alacritty&"
	];

    monitor= [
	  "eDP-1, 1920x1080@120, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, auto, auto"
	];
  };
}
