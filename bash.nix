{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    profileExtra = ''
    '';
    initExtra = ''
      neofetch
    '';
    shellAliases = {

    };
  };
}
