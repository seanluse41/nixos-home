{ config, pkgs, ... }:
{
	imports = [
		./modules/home/emulators.nix
		./modules/home/media.nix
		./modules/home/development.nix
	];
	home.username = "sean";
	home.homeDirectory = "/home/sean";
	home.stateVersion = "25.11";
}
