{config, pkgs, ...}:
{
 home.pointerCursor = {
#	name = "nordzy-cursor-theme";
#	package = pkgs.nordzy-cursor-theme;
#	size = 16;
	name = "Catppuccin-Mocha-Dark-Cursors";
	package = pkgs.catppuccin-cursors.mochaDark;
	size = 16;
  };
}
