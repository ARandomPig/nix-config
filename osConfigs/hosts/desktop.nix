
{ config, lib, inputs, pkgs, ... }:

{
  imports = [
    ../modules/game.nix
	../modules/nvidia.nix
	../modules/vboxHost.nix
  ];

  environment.systemPackages = with pkgs; [
  	cudatoolkit
  	lm_sensors
  ];

  networking.hostName = "nixos-fixe";

  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelModules = [ "kvm-intel" "nvidia" ];


  hardware.nvidia = {
	open = true;

	prime.nvidiaBusId = "PCI:1:0:0";
	prime.intelBusId = "PCI:0:2:0";
	prime.sync.enable = true;

	modesetting.enable = true;
  };

  services.openssh.enable = true;
}
