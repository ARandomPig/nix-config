HOST ?= $(file < /etc/nixosFlakeName)
THREADS ?= $(shell nproc)
FLAKE ?= .
MODE = switch

FLAGS = --impure --cores $(THREADS) -j $(THREADS) 

all: os home

update:
	cd $(FLAKE);nix flake update
	$(MAKE) all

os:
	sudo nixos-rebuild $(MODE) $(FLAGS) --flake $(FLAKE)#$(HOST)
home :
	home-manager $(MODE) $(FLAGS) --flake $(FLAKE)#$(HOST)

cleanup :
	sudo nix-collect-garbage -d
