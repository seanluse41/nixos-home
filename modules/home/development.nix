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
    # Design
    blender
  ];
  
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user.name = "seanluse41";
    settings.user.email = "seanluse41@gmail.com";
  };
  
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
