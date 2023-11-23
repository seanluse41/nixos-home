{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      daemonize = true;
      ignore-empty-password = false;
      image = "/home/sean/pictures/wallpapers/purple-flower-blur.jpg";
      fade-in = 5;
    };
  };
}
