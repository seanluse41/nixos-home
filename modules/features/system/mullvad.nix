# modules/features/system/mullvad.nix
{ self, ... }: {
  flake.nixosModules.mullvad = { ... }: {
    services.mullvad-vpn.enable = true;
  };
}