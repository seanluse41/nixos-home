{ self, inputs, ... }:
{
  flake.nixosConfigurations.homeServer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      homeServerConfig
      tailscale
      immich
      borgBackup
      uptimeKuma
      nfs
      jellyfin
      transmission
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.default
      {
        home-manager.extraSpecialArgs = { hostName = "homeServer"; };
        home-manager.users.sean.imports = with self.homeModules; [
          utils
          bash
          git
          ai
        ];
      }
    ];
  };
}