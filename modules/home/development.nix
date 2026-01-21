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
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dart-code.flutter
      vitaliymaz.vscode-svg-previewer
      tauri-apps.tauri-vscode
      svelte.svelte-vscode
      bradlc.vscode-tailwindcss
      #anthropic.claude-code
    ];
    profiles.default.userSettings = {
      "editor.quickSuggestions" = {
        strings = "on";
      };
      # fails to default theme if not installed manually
      "workbench.colorTheme" = "Shades of Purple";
      "explorer.confirmDragAndDrop" = false;
      "workbench.startupEditor" = "none";
      "explorer.confirmDelete" = false;
      "svelte.ask-to-enable-ts-plugin" = false;
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
