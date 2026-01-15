# modules/home/development.nix
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Godot
    godot
    # Android
    android-studio
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
