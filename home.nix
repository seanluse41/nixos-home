{ config, pkgs, ... }:
{
	imports = [
		./modules/home/emulators.nix
		./modules/home/media.nix
		./modules/home/development.nix
		./modules/home/utils.nix
	];
	home.username = "sean";
	home.homeDirectory = "/home/sean";
	home.stateVersion = "25.11";
	home.file."games".source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/games";
}
