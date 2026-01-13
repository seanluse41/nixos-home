# modules/home/media.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Video/Audio
    mpv
    yt-dlp
    audacity
    blender
    
    # Music
    ncmpcpp
    
    # Screenshot/Recording
    grim
    slurp
    wf-recorder
    swappy
    
    # Communication
    slack
    thunderbird
    zoom-us
    
    # File sharing
    qbittorrent
    filezilla
  ];

  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
    };
  };
}
