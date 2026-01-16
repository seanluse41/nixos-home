{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # flake shells
    kintone-shell = {
      url = "path:./shells/kintone";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tauri-shell = {
      url = "path:./shells/tauri";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      sops-nix,
      nix-flatpak,
      kintone-shell,
      tauri-shell,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.sean = import ./home.nix;
            home-manager.sharedModules = [
              nix-flatpak.homeManagerModules.nix-flatpak
            ];
          }
        ];
      };

      devShells.x86_64-linux = {
        kintone = kintone-shell.devShells.x86_64-linux.default;
        tauri = tauri-shell.devShells.x86_64-linux.default;
      };
    };
}
