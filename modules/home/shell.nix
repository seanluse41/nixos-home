{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#nixos";
    };
    initExtra = ''
      fastfetch
    '';
  };
}
