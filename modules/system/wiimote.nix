{ config, pkgs, ... }:
{
  # Load uinput module
  boot.kernelModules = [ "uinput" ];
  
  # udev rules for xwiimote
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660"
  '';
  
  # Add user to input group
  users.users.sean.extraGroups = [ "input" ];
  
  environment.systemPackages = with pkgs; [
    xwiimote
  ];
  
  # X11 input driver configuration
  services.xserver.inputClassSections = [
    ''
      Identifier "Nintendo Wii Remote"
      MatchProduct "Nintendo Wii Remote"
      MatchDevicePath "/dev/input/event*"
      Driver "xwiimote"
    ''
  ];
}