{ config, pkgs, ... }:

{
  imports =
    [
	./hardware-configuration.nix
	./modules/system/japanese.nix
	./modules/system/gaming.nix
    ];

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # SOPS secrets management
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  sops.secrets.luks-password = {};

  # Crypttab for second encrypted drive (1TB nvme)
  environment.etc."crypttab".text = ''
    cryptdata /dev/disk/by-uuid/05ac586c-45bc-4a9f-b0cc-96dc8b85b395 ${config.sops.secrets.luks-password.path}
  '';

  # Mount
  fileSystems."/mnt/data" = {
    device = "/dev/mapper/cryptdata";
    fsType = "ext4";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Udev
  services.udev.packages = [ pkgs.dolphin-emu ];

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  users.users.sean = {
    isNormalUser = true;
    description = "sean";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.system76-scheduler.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  services.flaresolverr = {
    enable = true;
    openFirewall = true;
  };

  services.mullvad-vpn.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "25.11";

}
