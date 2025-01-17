# Edit this configuration file to define what should be installed on your system. Help is available in the configuration.nix(5) man page, on 
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, inputs, pkgs, flakeName, ... }:

{ 
  imports = [
  	./hardware-configuration.nix
	./modules/yubikey.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    systemd-boot.enable = true;
	systemd-boot.memtest86.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  networking.networkmanager.enable = lib.mkDefault true;

  time.timeZone = "Europe/Paris";

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.tom = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" "libvirtd"];
     initialPassword = "password";
   };

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = lib.mkDefault false;

  environment.systemPackages = with pkgs; [
	home-manager
	killall
   	vim
	pciutils
	pigz
	htop
	gnumake
	git
	neofetch
	ntfs3g
	clang
	ninja
	gdb
	valgrind
	wget
	cmake
	usbutils
	man-pages
	stress
  ];

  #Open ports in the firewall.
  #  networking.firewall.allowedTCPPorts = [ ... ];
  #  networking.firewall.allowedUDPPorts = [ ... ];
  #Or disable the firewall altogether.
  #  networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?

  environment.etc.nixosFlakeName.text = "${flakeName}";

  programs.hyprland.enable = true;
}
