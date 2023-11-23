{ config, pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    timeouts = [
      {
        timeout = 10;
        command = "if pgrep -x swaylock; then hyprctl dispatch dpms off; fi";
        resumeCommand = "hyprctl dispatch dpms on";
      }
      {
        timeout = 900;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 930;
        command = "hyprctl dispatch dpms off";
        resumeCommand = "hyprctl dispatch dpms on";
      }
    ];
  };
}
