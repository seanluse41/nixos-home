{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#nixos";
      #homeServer = "ssh sean@192.168.50.232 -p 2283";
      #raspi32 = "ssh sean@192.168.50.";
      raspi256 = "ssh sean@192.168.50.191";
      ssd = "cd /mnt/data/";
      kintoneShell = "nix develop ~/nixConfig#kintone";
      tauriShell = "nix develop ~/nixConfig#tauri";
    };
    initExtra = ''
      fastfetch
      export NPM_CONFIG_PREFIX="$HOME/.npm-global"
      export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
    '';
  };
}