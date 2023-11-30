{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    profileExtra = ''
    '';
    initExtra = ''
      neofetch
    '';
    shellAliases = {
	homeServer = "ssh sean@192.168.50.110";
	raspi256 = "ssh sean@192.168.50.191";
	raspi32 = "ssh sean@192.168.50.139";
	immich = "chromium-browser 192.168.50.110:2283";
	config = "sudo nano /etc/nixos/configuration.nix";
	"..." = "cd /home/sean";
	homeManager = "cd /home/sean/.config/home-manager";
    };
  };
}
