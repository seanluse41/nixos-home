# modules/features/system/mullvad.nix
{ self, ... }: {
  flake.nixosModules.services = { ... }: {
    services.mullvad-vpn.enable = true;
  };
}