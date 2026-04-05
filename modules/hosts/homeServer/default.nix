# modules/hosts/home-server/default.nix
{ inputs, self, ... }: {
  flake.nixosConfigurations.home-server = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./hardware-configuration.nix
      ./configuration.nix
      inputs.sops-nix.nixosModules.sops
    ];
  };
}