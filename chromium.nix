{ config, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = ["--enable-wayland-ime"];
  };
}
