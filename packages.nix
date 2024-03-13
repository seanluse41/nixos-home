{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wget
    polkit
    neofetch
    hyprpicker
    hyprpaper
    hypridle
    hyprlock
    wl-clipboard
    qt5.qtwayland
    qt6.qtwayland
    killall
    unzip
    unrar
    wireplumber
    wev
    slurp
    swappy
    gamescope
    libnotify
    ranger
    libva
    vaapiVdpau
    dwarfs
    fuse-overlayfs
    # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
    gst_all_1.gstreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
    gst_all_1.gst-plugins-base
    # Specialized plugins separated by quality
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
    gst_all_1.gst-libav
    # Support the Video Audio (Hardware) Acceleration API
    gst_all_1.gst-vaapi
    wine-staging
    polkit_gnome
    godot_4
    ryujinx
    grim
    qbittorrent
    hyprpicker
    dolphin-emu
    pcsx2
    rpcs3
    heroic
    flutter
    ruby
    nodejs
    mpc-cli
    jackett
    retroarchFull
    wf-recorder
    p7zip
    appimage-run
    yt-dlp
    tartube
    rpi-imager
    nil
    nixpkgs-fmt
    flowblade
    pv
  ];
}
