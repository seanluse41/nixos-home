# modules/features/dev/development.nix
{ self, ... }: {
  # desktop
  flake.homeManagerModules.developmentDesktop = { config, pkgs, lib, ... }: {
    home.packages = with pkgs; [
      godot
      android-studio
      android-tools
      flutter
      rustup
      nodejs
      clang
      gh
      git-lfs
      claude-code
      blender
      stripe-cli
      cargo-tauri
      awscli2
      aws-sam-cli
    ];

    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.extensions =
        with pkgs.vscode-extensions; [
          dart-code.flutter
          vitaliymaz.vscode-svg-previewer
          tauri-apps.tauri-vscode
          svelte.svelte-vscode
          bradlc.vscode-tailwindcss
          tamasfe.even-better-toml
          redhat.vscode-yaml
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
        "editor.quickSuggestions".strings = "on";
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
        "terminal.integrated.stickyScroll.enabled" = false;
        "redhat.telemetry.enabled" = false;
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

    home.activation.awsCredentials = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p ~/.aws
      cat > ~/.aws/credentials << EOF
      [default]
      aws_access_key_id=$(cat /run/secrets/aws-access-key-id)
      aws_secret_access_key=$(cat /run/secrets/aws-secret-access-key)
      EOF
      chmod 600 ~/.aws/credentials
    '';
  };

  # work
  flake.homeManagerModules.developmentWork = { pkgs, ... }: {
    home.packages = with pkgs; [
      android-tools
      rustup
      nodejs
      clang
      git-lfs
      postman
      podman-desktop
      cargo-tauri
      stripe-cli
      aws-sam-cli
      awscli2
    ];

    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      profiles.default.extensions =
        with pkgs.vscode-extensions; [
          dart-code.flutter
          dart-code.dart-code
          tauri-apps.tauri-vscode
          svelte.svelte-vscode
          bradlc.vscode-tailwindcss
          jnoortheen.nix-ide
          tamasfe.even-better-toml
          redhat.vscode-yaml
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
        "editor.quickSuggestions"."strings" = "on";
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
        "extensions.ignoreRecommendations" = true;
      };
    };

    programs.git = {
      enable = true;
      lfs.enable = true;
      settings.user.name = "sean-kintone";
      settings.user.email = "sean@kintone.com";
    };

    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}