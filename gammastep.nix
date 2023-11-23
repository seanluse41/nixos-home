{ config, pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 35.65;
    longitude = 139.84;
    temperature = {
      day = 6500;
      night = 4500;
  };
};
}
