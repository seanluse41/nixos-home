{ self, inputs, ... }:
{
  flake.homeModules.devPackages =
    { pkgs, lib, ... }:
    {
      home.packages = with pkgs; [
        godot
        android-studio
        android-tools
        flutter
        rustup
        nodejs
        clang
        gh
        git-lfs
        claude-code
        blender
        stripe-cli
        cargo-tauri
      ];
    };
}
