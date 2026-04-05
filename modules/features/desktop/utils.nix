# modules/features/desktop/utils.nix
{ self, ... }: {
  flake.homeManagerModules.utils = { pkgs, ... }: {
    home.packages = with pkgs; [
      unzip zip unrar nixfmt appimage-run
      xdg-utils system-config-printer erdtree nvd sops age
    ];

    services.flatpak.packages = [ "com.github.tchx84.Flatseal" ];

    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
      commandLineArgs = [
        "--enable-features=VaapiVideoDecoder"
        "--disable-features=UseChromeOSDirectVideoDecoder"
      ];
      extensions = [
        { id = "pnmaklegiibbioifkmfkgpfnmdehdfan"; }
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
        { id = "nngceckbapebfimnlniiiahkandclblb"; }
        { id = "ophjlpahpchlmihnnnihgmmeilfjmjjc"; }
      ];
    };
  };
}