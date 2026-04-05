# modules/features/dev/git.nix
{ self, ... }: {
  flake.homeManagerModules.gitDesktop = { ... }: {
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
  };

  flake.homeManagerModules.gitWork = { ... }: {
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