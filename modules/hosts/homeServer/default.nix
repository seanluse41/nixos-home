{ self, inputs, ... }: {
  flake.nixosConfigurations.homeServer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.homeServerConfig
    ];
  };
}