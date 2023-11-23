{ config, pkgs, ... }:

{
services.mpd = {
  enable = true;
  musicDirectory = "/home/sean/music";
  network.startWhenNeeded = true;
  dataDir = "${config.home.homeDirectory}/.config/mpd";
  extraConfig = ''
    follow_outside_symlinks "yes"
    auto_update "yes"
    audio_output {
      type "fifo"
      name "Visualizer"
      format "44100:16:2"
      path "/tmp/mpd.fifo"
    }
    audio_output {
      type "pipewire"
      name "My PipeWire Output"
    }
  '';
  };
}
