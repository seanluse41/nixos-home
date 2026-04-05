# modules/features/shell.nix
{ self, ... }:
let consts = import ../_consts.nix; in
{
  # server bash aliases
  flake.nixosModules.shell = { ... }: {
    programs.bash.shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#home-server && nvd diff /run/booted-system /run/current-system";
    };
  };

  # desktop home-manager
  flake.homeManagerModules.shellDesktop = { pkgs, ... }: {
    programs.bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#desktop && nvd diff /run/booted-system /run/current-system";
        homeServer = "ssh ${consts.user}@${consts.network.homeServer}";
        photoFrame = "ssh ${consts.user}@${consts.network.photoFrame}";
        pi-hole = "ssh ${consts.user}@${consts.network.piHole}";
        raspi256 = "ssh ${consts.user}@${consts.network.pi256}";
        ssd = "cd /mnt/data/";
        kintoneShell = "nix develop ~/nixConfig#kintone";
        tauriShell = "nix develop ~/nixConfig#tauri";
        tree = "erd -H .";
        rebuildServer = "nixos-rebuild switch --flake ~/nixConfig/homeServer#home-server --target-host ${consts.user}@${consts.network.homeServer} --ask-sudo-password";
      };
      sessionVariables.SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
      initExtra = ''
        fastfetch
        export NPM_CONFIG_PREFIX="$HOME/.npm-global"
        export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
      '';
    };

    programs.starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        add_newline = true;
        command_timeout = 5000;
        git_branch = { format = "\\[[$branch]($style)\\]"; symbol = ""; };
        git_status.format = "(\\[[$all_status$ahead_behind]($style)\\])";
        nodejs.format = "\\[[$version]($style)\\]";
        rust.format = "\\[[$version]($style)\\]";
        nix_shell.format = "\\[[$state( \\($name\\))]($style)\\]";
        cmd_duration.format = "\\[[⏱ $duration]($style)\\]";
        time = { format = "\\[[$time]($style)\\]"; disabled = false; };
        directory.format = "[$path]($style) ";
      };
    };

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

  # work home-manager
  flake.homeManagerModules.shellWork = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      shellAliases = {
        rebuild = "home-manager switch --flake ~/.config/home-manager#seanluse";
      };
      initContent = ''
        fastfetch
        ulimit -n 65535
        export ANDROID_HOME="/Users/sean/Library/Android/sdk"
        export NDK_HOME="$ANDROID_HOME/ndk/29.0.13113456"
        export PATH="$HOME/.npm-global/bin:$PATH"
      '';
      sessionVariables.EDITOR = "nano";
    };

    programs.starship = {
      en