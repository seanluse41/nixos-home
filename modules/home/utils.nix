# modules/home/utils.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
    zip
    unrar
    fastfetch
    nixfmt
    appimage-run
    xdg-utils
    system-config-printer
    erdtree
    nvd
  ];

  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
  ];

programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "linux";
      };
      display = {
        separator = ": ";
      };
      modules = [
        "break"
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "cpu"
        "gpu"
        "memory"
        "disk"
      ];
    };
  };

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--enable-features=VaapiVideoDecoder"  # hardware video decode
      "--disable-features=UseChromeOSDirectVideoDecoder"
    ];
    extensions = [
      { id = "pnmaklegiibbioifkmfkgpfnmdehdfan"; } # 10ten Japanese Reader
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "ophjlpahpchlmihnnnihgmmeilfjmjjc"; } # LINE
    ];
  };
}
