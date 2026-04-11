{ self, inputs, ... }:
{
  flake.homeModules.utils =
    { pkgs, ... }:
    let
      llama = if pkgs.stdenv.isDarwin then pkgs.llama-cpp else pkgs.llama-cpp-rocm;
    in
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
        npm-check-updates
        clang
        git-lfs
        stripe-cli
        cargo-tauri
        uv
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
