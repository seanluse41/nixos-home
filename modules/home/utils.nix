# modules/home/media.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
    zip
    unrar
    fastfetch
  ];

}
