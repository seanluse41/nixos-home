{ self, inputs, ... }: {
  flake.homeModules.devPackages = { pkgs, ... }: {
    home.packages = with pkgs; [
      godot
      android-studio
      blender
    ];
  };
}