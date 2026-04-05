# modules/hosts/home-server/configuration.nix
{ self, inputs, ... }:
{
  flake.nixosModules.homeServerConfiguration =
    { config, pkgs, ... }:
    {
      imports = with self.nixosModules; [
        tailscale
        immich
        ethernetWatchdog
        borgBackup
        uptimeKuma
        nfs
        jellyfin
        transmission
        shell
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      sops = {
        defaultSopsFile = self + "/secrets/personal.yaml";
        age.keyFile = "/var/lib/sops-nix/key.txt";
      };

      nix.settings.trusted-public-keys = [
        "desktop:BhUdL4xwaKkc77fe+B7iQulMzkd5VWXSyQKZ2rnGp04="
      ];

      networking = {
        hostName = "home-server";
        networkmanager.enable = true;
        firewall = {
          allowedTCPPorts = [
            22
            80
            443
            8080
          ];
          allowedUDPPorts = [ ];
        };
      };

      time.timeZone = "Asia/Tokyo";
      i18n.defaultLocale = "en_US.UTF-8";
      console.keyMap = "jp106";
      services.xserver.xkb.layout = "jp";

      users.users.sean = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "docker"
          "networkmanager"
        ];
      };

      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-compute-runtime
        ];
      };

      environment.systemPackages = with pkgs; [
        wget
        git
        gh
        vim
        htop
        btop
        docker-compose
        tree
        erdtree
        nvd
        claude-code
      ];

      nix.gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 3d";
      };
      nix.settings.auto-optimise-store = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      services.journald.extraConfig = ''
        SystemMaxUse=100M
        MaxRetentionSec=3day
      '';

      virtualisation.docker.enable = true;

      services.openssh = {
        enable = true;
        settings.PasswordAuthentication = true;
      };

      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "24.11";
    };
}
