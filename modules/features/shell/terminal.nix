# modules/features/shell/terminal.nix
{ self, ... }:
let consts = import ../../_consts.nix; in
{
  flake.nixosModules.shell = { ... }: {
    programs.bash.shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#home-server && nvd diff /run/booted-system /run/current-system";
    };
  };

  flake.homeManagerModules.shellDesktop = { pkgs, ... }: {
    programs.bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixConfig#desktop && nvd diff /run/booted-system /run/current-system";
        rebuildServer = "nixos-rebuild switch --flake ~/nixConfig#home-server --target-host ${consts.user}@${consts.network.homeServer} --use-remote-sudo";
        homeServer = "ssh ${consts.user}@${consts.network.homeServer}";
        photoFrame = "ssh ${consts.user}@${consts.network.photoFrame}";
        pi-hole = "ssh ${consts.user}@${consts.network.piHole}";
        raspi256 = "ssh ${consts.user}@${consts.network.pi256}";
        ssd = "cd /mnt/data/";
        kintoneShell = "nix develop ~/nixConfig#kintone";
        tauriShell = "nix develop ~/nixConfig#tauri";
        tree = "erd -H .";
      };
      sessionVariables.SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
      initExtra = ''
        fastfetch
        export NPM_CONFIG_PREFIX="$HOME/.npm-global"
        export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
      '';
    };
  };

  flake.homeManagerModules.shellWork = { ... }: {
    programs.zsh = {
      enable = true;
      shellAliases = {
        rebuild = "home-manager switch --flake ~/.config/home-manager#seanluse";
      };
      initContent = ''
        fastfetch
        ulimit -n 65535
        export ANDROID_HOME="/Users/sean/Library/Android/sdk"
        export NDK_HOME="$ANDROID_HOME/ndk/29.0.13113456"
        export PATH="$HOME/.npm-global/bin:$PATH"
      '';
      sessionVariables.EDITOR = "nano";
    };
  };
}