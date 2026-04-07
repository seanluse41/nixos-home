{ self, inputs, ... }: {
  flake.nixosConfigurations.homeServer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.homeServerConfig
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.default
      (with self.nixosModules; [
        homeServerHardware
        tailscale
        immich
        borgBackup
        uptimeKuma
        nfs
        jellyfin
        transmission
      ])
      {
        home-manager.users.sean.imports = with self.homeModules; [
          utils
          bash
          git
        ];
      }
    ];
  };
}