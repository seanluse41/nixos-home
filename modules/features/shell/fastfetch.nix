# modules/features/shell/fastfetch.nix
{ self, ... }: {
  flake.homeManagerModules.fastfetch = { ... }: {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo.source = "linux";
        display.separator = ": ";
        modules = [
          "break" "title" "separator" "os" "kernel"
          "uptime" "packages" "cpu" "gpu" "memory" "disk"
        ];
      };
    };
  };
}