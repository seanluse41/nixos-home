# modules/system/gaming.nix
{ config, pkgs, ... }:

{
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # GameMode
  programs.gamemode.enable = true;

  # Wine dependencies
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Packages needed for gaming
  environment.systemPackages = with pkgs; [
    wine-staging
    winetricks
    heroic
  ];
}
