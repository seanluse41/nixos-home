{ config, pkgs, ... }:
{
	imports = [
		./modules/home/emulators.nix
		./modules/home/media.nix
		./modules/home/development.nix
	];
	home.username = "sean";
	home.homeDirectory = "/home/sean";
programs.git = {
  enable = true;
  settings.user.name = "seanluse41";
  settings.user.email = "seanluse41@gmail.com";
	};
	home.stateVersion = "25.11";
}
