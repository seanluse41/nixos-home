{ config, pkgs, ... }:
{
  imports = [
    ./modules/home/emulators.nix
    ./modules/home/media.nix
    ./modules/home/development.nix
    ./modules/home/utils.nix
    ./modules/home/shell.nix
    ./modules/home/communications.nix
  ];
  home.username = "sean";
  home.homeDirectory = "/home/sean";
  home.stateVersion = "25.11";
  home.file."games".source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/games";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Breeze_Light";
    size = 24;
    package = pkgs.kdePackages.breeze;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Breeze_Light";
    XCURSOR_SIZE = "24";
  };

  gtk.cursorTheme = {
    name = "Breeze_Light";
    size = 24;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Breeze_Light";
      cursor-size = 24;
    };
  };

  services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    overrides = {
      global = {
        Context.filesystems = [ "/nix/store:ro" ];
      };
    };
  };

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
