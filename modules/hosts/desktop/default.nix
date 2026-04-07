{ self, inputs, ... }: {
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  systems = [ "x86_64-linux" ];

  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.desktopConfig
    ];
  };
}