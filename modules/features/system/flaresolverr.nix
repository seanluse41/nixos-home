# modules/features/system/flaresolverr.nix
{ self, ... }: {
  flake.nixosModules.flaresolverr = { ... }: {
    services.flaresolverr = {
      enable = true;
      openFirewall = true;
    };
  };
}