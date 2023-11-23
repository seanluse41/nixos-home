{ config, ... }:
{
  programs.gh = {
	enable = true;
	gitCredentialHelper = {
	  enable = true;
	  hosts = ["https://github.com"];
	};
	settings = {
	  git_protocol = "ssh";
	  prompt = "enabled";
	  aliases = {
	    co = "pr checkout";
	    pv = "pr view";
	  };
	};
  };
}
