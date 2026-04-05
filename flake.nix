# flake.nix
{
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

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # dev shells
    tauri-shell = {
      url = "path:./shells/tauri";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # pinned for hugo/sass
    nixpkgs-hugo.url = "github:nixos/nixpkgs/c5dd43934613ae0f8ff37c59f61c507c2e8f980d";
    nixpkgs-sass.url = "github:nixos/nixpkgs/d4b3787c6d5a80780e355d09e2fcc9d56458ba29";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
