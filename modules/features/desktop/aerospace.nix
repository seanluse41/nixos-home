# modules/features/desktop/aerospace.nix
{ self, ... }: {
  flake.homeManagerModules.aerospace = { ... }: {
    programs.aerospace = {
      enable = true;
      launchd.enable = true;
      settings = {
        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;
        accordion-padding = 30;
        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";
        key-mapping.preset = "qwerty";

        gaps = {
          inner.horizontal = 12;
          inner.vertical = 16;
          outer.left = 16;
          outer.bottom = 16;
          outer.top = 16;
          outer.right = 24;
        };

        mode.main.binding = {
          cmd-h = "layout tiles horizontal vertical";
          cmd-left = "focus left";
          cmd-down = "focus down";
          cmd-up = "focus up";
          cmd-right = "focus right";
          cmd-shift-left = "move left";
          cmd-shift-down = "move down";
          cmd-shift-up = "move up";
          cmd-shift-right = "move right";
          cmd-shift-minus = "resize smart -50";
          cmd-shift-equal = "resize smart +50";
          cmd-1 = "workspace 1";
          cmd-2 = "workspace 2";
          cmd-3 = "workspace 3";
          cmd-4 = "workspace 4";
          cmd-5 = "workspace 5";
          cmd-6 = "workspace 6";
          cmd-7 = "workspace 7