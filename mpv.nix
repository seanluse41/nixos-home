{ pkgs, config, ... }:
  {
    programs.mpv = {
	enable = true;
	config = {
	  profile = "gpu-hq";
	  gpu-context = "wayland";
	  hwdec="auto-safe";
	  vo="gpu";
    };
  };
}
