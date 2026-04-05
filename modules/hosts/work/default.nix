# modules/hosts/work/default.nix
{ inputs, self, ... }: {
  flake.homeConfigurations.seanluse = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "aarch64-darwin";
      config.allowUnfree = true;
      config.documentation.enable = false;
    };
    extraSpecialArgs = { inherit (inputs) nixpkgs-hugo nixpkgs-sass; };
    modules = [
      inputs.sops-nix.homeManagerModules.sops
      { imports = with self.homeManagerModules; [
          development
          shell
          kintone
          communications
          aerospace
      ]; }
      {
        home.username = "seanluse";
        home.homeDirectory = "/Users/sean";
        home.stateVersion = "25.05";
        programs.home-manager.enable = true;
        news.display = "silent";
        fonts.fontconfig.enable = true;
        home.packages = with import inputs.nixpkgs { system = "aarch64-darwin"; }; [
          age sops nerd-fonts.jetbrains-mono
        ];
        sops = {
          defaultSopsFile = self + "/secrets/work.yaml";
          age.keyFile = "/Users/sean/.config/sops/age/keys.txt";
        };
        nix.gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 5d";
        };
      }
    ];
  };
}