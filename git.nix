{ config, lib, ... }:
{
  programs.git = {
    enable = true;
    diff-so-fancy = {
	enable = true;
	changeHunkIndicators = true;
    };
    userName = "seanluse41";
    userEmail = "seanluse41@gmail.com";
    extraConfig = lib.mkForce {
	credential."https://github.com".helper = "!gh auth git-credential";
    };
  };
}
