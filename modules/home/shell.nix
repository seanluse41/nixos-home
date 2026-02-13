{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#nixos && nvd diff /run/booted-system /run/current-system";
      rebuildServer = "nixos-rebuild switch --flake ~/nixConfig/homeServer#home-server --target-host sean@192.168.50.110 --ask-sudo-password";
      homeServer = "ssh sean@192.168.50.110";
      photoFrame = "ssh sean@192.168.50.139";
      pi-hole = "ssh sean@192.168.50.84";
      #raspi256 = "ssh sean@192.168.50.191";
      ssd = "cd /mnt/data/";
      kintoneShell = "nix develop ~/nixConfig#kintone";
      tauriShell = "nix develop ~/nixConfig#tauri";
      tree = "erd -H .";
    };
    initExtra = ''
      fastfetch
      export NPM_CONFIG_PREFIX="$HOME/.npm-global"
      export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
    '';
  };
}
