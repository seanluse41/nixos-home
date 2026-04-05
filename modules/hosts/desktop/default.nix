# modules/hosts/desktop/default.nix
{ inputs, self, ... }:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./hardware-configuration.nix
      ./configuration.nix
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.sean = {
            imports = with self.homeManagerModules; [
              emulators
              media
              development
              utils
              shell
              communications
            ];
          };
        };
      }
    ];
  };
}
