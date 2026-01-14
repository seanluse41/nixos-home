# modules/home/emulators.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dolphin-emu
    melonDS
    pcsx2
    rpcs3
    ryubing
#    duckstation
    fceux
#    snes9x-gtk
  ];
  services.flatpak.packages = [
    "org.duckstation.DuckStation"
    "com.snes9x.Snes9x"
  ];
}
