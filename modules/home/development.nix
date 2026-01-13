# modules/home/development.nix
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Editors
    vscodium
    # Godot
    godot
    # Android
    android-studio
    # Languages
    rustup
    nodejs
    clang
    # Tools
    gh
    git-lfs
  ];
  
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
