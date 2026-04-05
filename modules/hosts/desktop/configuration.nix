# modules/hosts/desktop/configuration.nix
{ self, inputs, ... }:
{
  flake.nixosModules.desktopConfiguration =
    { self, config, pkgs, ... }:
    {
      imports = with self.nixosModules; [
        gaming
        japanese
        wiimote
        mullvad
        flaresolverr
        tailscale
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.settings = {
        max-jobs = 8;
        cores = 0;
      };

      documentation.enable = false;

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      nix.settings.auto-optimise-store = true;

      sops.defaultSopsFile = self + "/secrets/personal.yaml";
      sops.age.keyFile = "/var/lib/sops-nix/key.txt";
      sops.secrets.luks-password = { };
      sops.secrets.aws-access-key-id = {
        owner = "sean";
      };
      sops.secrets.aws-secret-access-key = {
        owner = "sean";
      };

      nix.settings.secret-key-files = [ "/var/lib/sops-nix/signing-key.sec" ];

      environment.etc."crypttab".text = ''
        cryptdata /dev/disk/by-uuid/05ac586c-45bc-4a9f-b0cc-96dc8b85b395 ${config.sops.secrets.luks-password.path}
      '';

      fileSystems."/mnt/data" = {
        device = "/dev/mapper/cryptdata";
        fsType = "ext4";
      };

      fileSystems."/mnt/media" = {
        device = "192.168.50.110:/ssd/media";
        fsType = "nfs";
        options = [
          "nfsvers=4"
          "soft"
          "timeo=30"
          "noauto"
          "x-systemd.automount"
        ];
      };

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.kernel.sysctl."vm.unprivileged_userfaultfd" = 1;

      security.pam.loginLimits = [
        {
          domain = "*";
          type = "soft";
          item = "memlock";
          value = "unlimited";
        }
        {
          domain = "*";
          type = "hard";
          item = "memlock";
          value = "unlimited";
        }
      ];

      networking.hostName = "nixos";
      networking.networkmanager.enable = true;

      services.printing.enable = true;
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      services.udev.packages = [ pkgs.dolphin-emu ];
      services.desktopManager.cosmic.enable = true;
      services.displayManager.cosmic-greeter.enable = true;
      services.system76-scheduler.enable = true;
      services.flatpak.enable = true;

      time.timeZone = "Asia/Tokyo";
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

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
          General = {
            Enable = "Source,Sink,Media,Socket";
            Experimental = true;
            FastConnectable = true;
          };
          Policy.AutoEnable = true;
        };
      };

      users.users.sean = {
        isNormalUser = true;
        description = "sean";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "25.11";
    };
}
