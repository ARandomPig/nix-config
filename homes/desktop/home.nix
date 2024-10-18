{ config, lib, pkgs, ... }:

{
  imports = [ ./nitrogen.nix ];
  home.file = {
    ".config/bspwm/screenlayout.sh".source = ./bspwm/screenlayout.sh;
    ".config/bspwm/host.sh".source = ./bspwm/host.sh;
  };
}
