{ self, inputs, ... }: {
  flake.homeModules.kintone = { pkgs, ... }:
  let
    version = "1.19.1";
    cli-kintone = pkgs.stdenvNoCC.mkDerivation {
      pname = "cli-kintone";
      inherit version;
      src = pkgs.fetchurl {
        url = "https://github.com/kintone/cli-kintone/releases/download/v${version}/cli-kintone_v${version}_macos.zip";
        sha256 = "sha256-vLAU4c79kWq4WtF9PaF/kwj8kMxoaC4KeotD0rodBIc=";
      };
      nativeBuildInputs = [ pkgs.unzip ];
      unpackPhase = "unzip $src";
      installPhase = ''
        mkdir -p $out/bin
        cp cli-kintone-macos/cli-kintone $out/bin/
        chmod +x $out/bin/cli-kintone
      '';
    };
  in
  {
    home.packages = [ cli-kintone ];
  };
}