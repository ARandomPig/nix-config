{ lib, config, ... }:

{
  config = lib.mkIf config.mods.hyprland.enable {
    programs.hyprlock.enable = true;
	programs.hyprlock.settings = {
      general = {
      	no_fade_out = true;
      	ignore_empty_input = false;
      };
      
      background  = {
      	monitor = "";
      	path = "~/.config/pc.jpg";
#      	blur_passes = 1;
      };
      
      input-field = {
      	monitor = "";
      	size = "300, 50";
      	dot_size = "0.2";
      	dots_fade_time = 100;
      	inner_color = "rgb(139,89,100)";
      	outer_color = "rgb(139,89,100)";
      	outline_thickness = 1;
      
      	fail_transition = "300";
      	fail_text = "learn to write, idiot";
      };
    };
  };
}
