# modules/home/media.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
    zip
    unrar
    fastfetch
  ];

programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "linux";
      };
      display = {
        separator = ": ";
      };
      modules = [
        "break"
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "cpu"
        "gpu"
        "memory"
        "disk"
      ];
    };
  };
}
