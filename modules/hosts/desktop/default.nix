{ self, inputs, ... }: {
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfig
    ];
  };
}