{ config, pkgs, ...}:
{
  services.mako = {
    enable = true;
    defaultTimeout = 3000;
    backgroundColor = "#3B403A";
    borderColor = "#DAb6De";
    borderRadius = 10;
    borderSize = 3;
    layer = "top";
    padding = "32";
    progressColor = "#e8b32a";
    textColor = "#f9faf6";
};
}
