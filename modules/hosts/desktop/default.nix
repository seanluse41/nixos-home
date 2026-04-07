{ self, inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  systems = [ "x86_64-linux" ];

  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      desktopConfig
      inputs.home-manager.nixosModules.default
      {
        home-manager.users.sean.imports = with self.homeModules; [
          chromium
          bash
          vscode
          git
          devPackages
          mpd
          ncmpcpp
          mpv
          mediaPackages
          communications
          emulators
          utils
          aws
          kintone
        ];
      }
    ];
  };
}
