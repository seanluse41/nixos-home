# modules/home/media.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Video/Audio
    mpv
    yt-dlp
    audacity
    blender
    mpc
       
    # Screenshot/Recording
    kooha
    
    # File sharing
    qbittorrent
    filezilla
    prowlarr
    ani-cli
  ];

  services.mpdris2.enable = true;

  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
    };
  };

services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }
      audio_output {
        type "fifo"
        name "Visualizer"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
    settings = {
      mpd_host = "localhost";
      mpd_port = 6600;
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "Visualizer";
      visualizer_in_stereo = "yes";
      visualizer_type = "spectrum";
      visualizer_look = "●●";
      visualizer_spectrum_smooth_look = "no";
      startup_screen = "visualizer";
    };
  };

  systemd.user.services.prowlarr = {
    Unit = {
      Description = "Prowlarr";
      After = [ "network.target" ];
    };
    Service = {
      ExecStart = "${pkgs.prowlarr}/bin/Prowlarr -nobrowser -data=%h/.config/Prowlarr";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
