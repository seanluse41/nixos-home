{ config, pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    profiles."default" = {
      isDefault = true;
    };
  };

  # Force Thunderbird to use XDG directories
  home.sessionVariables = {
    THUNDERBIRD_HOME = "${config.xdg.configHome}/thunderbird";
  };

  home.packages = with pkgs; [
    slack
    zoom-us
  ];
}