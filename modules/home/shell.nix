{ config, pkgs, ... }:
let
  consts = import ../../consts.nix;
in
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#nixos && nvd diff /run/booted-system /run/current-system";
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
    initExtra = ''
      fastfetch
      export NPM_CONFIG_PREFIX="$HOME/.npm-global"
      export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
    '';
  };
}