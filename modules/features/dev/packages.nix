# modules/features/dev/packages.nix
{ self, ... }:
{
  flake.homeManagerModules.utilPackages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        godot
        android-studio
        android-tools
        flutter
        rustup
        nodejs
        clang
        git-lfs
        claude-code
        stripe-cli
        cargo-tauri
        awscli2
        aws-sam-cli
      ];
    };
}
