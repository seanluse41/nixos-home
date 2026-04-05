# modules/features/system/flaresolverr.nix
{ self, ... }: {
  flake.nixosModules.services = { ... }: {
    services.flaresolverr = {
      enable = true;
      openFirewall = true;
    };
  };
}