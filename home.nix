{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    ./mako/mako.nix
    ./waybar.nix
    ./bash.nix
    ./kitty.nix
    ./cursor.nix
    ./gammastep.nix
    ./mpv.nix
    ./chromium.nix
    ./mpd.nix
    ./ncmpcpp.nix
    ./vscodium.nix
    ./wofi.nix
    ./feh.nix
    ./gh.nix
    ./git.nix
    ./packages.nix
    ./xdgMimeApps.nix
    ./ripgrep.nix
    ./joplin.nix
  ];
  home.username = "sean";
  home.homeDirectory = "/home/sean";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.htop
    pkgs.termite
  ];
  xdg.configFile."ranger/rc.conf".source = ./rc.conf;
  xdg.configFile."waybar/style.css".source = ./waybarStyle.css;
  xdg.configFile."swappy/config".source = ./swappy.conf;
  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
