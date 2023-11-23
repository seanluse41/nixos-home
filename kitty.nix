{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = "include ../home-manager/kittyTheme.conf";
    font = {
    name = "Ubuntu";
    size = 12;
  };
    settings = {
	confirm_os_window_close = 0;
  };
#    theme = "Japanesque";
  };
}
