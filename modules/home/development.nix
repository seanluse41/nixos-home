# modules/home/development.nix
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Godot
    godot
    # Android
    android-studio
    android-tools
    flutter
    # Languages
    rustup
    nodejs
    clang
    # Tools
    gh
    git-lfs
    claude-code
    # Design
    blender
    # Cli
    stripe-cli
    cargo-tauri
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        dart-code.flutter
        vitaliymaz.vscode-svg-previewer
        tauri-apps.tauri-vscode
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        #anthropic.claude-code
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-kanbn-boards";
          publisher = "samgiz";
          version = "0.14.1";
          sha256 = "sha256-+BIMS5icyEmj1JXKVZmcOfTFI4w/F1zpjbt9ziG7XEk=";
        }
        {
          name = "shades-of-purple";
          publisher = "ahmadawais";
          version = "7.3.6";
          sha256 = "sha256-22ZywGew1Qh4YPi51JWTNQLKuz/nzx/iprUK96DQfYU=";
        }
      ];
    profiles.default.userSettings = {
      "editor.quickSuggestions" = {
        strings = "on";
      };
      "workbench.colorTheme" = "Shades of Purple";
      "explorer.confirmDragAndDrop" = false;
      "workbench.startupEditor" = "none";
      "explorer.confirmDelete" = false;
      "svelte.ask-to-enable-ts-plugin" = false;
      "update.showReleaseNotes" = false;
      "editor.stickyScroll.enabled" = false;
      "terminal.integrated.initialHint" = false;
      "git.openRepositoryInParentFolders" = "never";
      "explorer.confirmPasteNative" = false;
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user.name = "seanluse41";
    settings.user.email = "seanluse41@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
