{ config, pkgs, ... }:
{
  imports = [
    ./modules/home/emulators.nix
    ./modules/home/media.nix
    ./modules/home/development.nix
    ./modules/home/utils.nix
    ./modules/home/shell.nix
  ];
  home.username = "sean";
  home.homeDirectory = "/home/sean";
  home.stateVersion = "25.11";
  home.file."games".source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/games";

  xdg.configFile."fcitx5/profile".text = ''
    [Groups/0]
    Name=Default
    Default Layout=us
    DefaultIM=mozc

    [Groups/0/Items/0]
    Name=keyboard-us
    Layout=

    [Groups/0/Items/1]
    Name=mozc
    Layout=

    [GroupOrder]
    0=Default
  '';
}
