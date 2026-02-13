{ config, pkgs, ... }:
let
  consts = import ../../homeServer/consts.nix;
in
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#nixos && nvd diff /run/booted-system /run/current-system";
      homeServer = "ssh ${consts.user}@${consts.network.homeServer}";
      photoFrame = "ssh ${consts.user}@${consts.network.photoFrame}";
      pi-hole = "ssh ${consts.user}@${consts.network.piHole}";
      ssd = "cd /mnt/data/";
      kintoneShell = "nix develop ~/nixConfig#kintone";
      tauriShell = "nix develop ~/nixConfig#tauri";
      tree = "erd -H .";
      rebuildServer = "nixos-rebuild switch --flake ~/nixConfig/homeServer#home-server --target-host ${consts.user}@${consts.network.homeServer} --ask-sudo-password";
      rebootServer = "echo 'REBOOT' | nc -u ${consts.network.homeServer} ${toString consts.ports.udpReboot}";
    };
    initExtra = ''
      fastfetch
      export NPM_CONFIG_PREFIX="$HOME/.npm-global"
      export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
    '';
  };
}