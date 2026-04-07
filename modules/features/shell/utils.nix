{ self, inputs, ... }:
{
  flake.homeModules.utils =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        unzip
        zip
        unrar
        fastfetch
        nixfmt
        erdtree
        nvd
        sops
        age
        wget
        git
        gh
        vim
        htop
        btop
        docker-compose
        claude-code
        android-tools
        flutter
        rustup
        nodejs
        clang
        git-lfs
        stripe-cli
        cargo-tauri
        llmfit
      ];

      programs.fastfetch = {
        enable = true;
        settings = {
          logo.source = "linux";
          display.separator = ": ";
          modules = [
            "break"
            "title"
            "separator"
            "os"
            "kernel"
            "uptime"
            "packages"
            "cpu"
            "gpu"
            "memory"
            "disk"
          ];
        };
      };
    };
}