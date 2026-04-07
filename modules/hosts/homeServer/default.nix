{ self, inputs, ... }:
{
  flake.nixosConfigurations.homeServer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      homeServerConfig
      homeServerHardware
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.default
      {
        home-manager.users.sean.imports = with self.homeModules; [
          utils
          bash
          git
          tailscale
          immich
          borgBackup
          uptimeKuma
          nfs
          jellyfin
          transmission
        ];
      }
    ];
  };
}
