{ config, pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    profiles."default" = {
      isDefault = true;
    };
  };

  # Force Thunderbird to use XDG directories
  home.sessionVariables = {
    THUNDERBIRD_HOME = "${config.xdg.configHome}/thunderbird";
  };

  accounts.email.accounts = {
    "gmail" = {
      primary = true;
      address = "seanluse41@gmail.com";
      realName = "Sean";
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls.enable = true;
      };
      userName = "seanluse41@gmail.com";
      thunderbird.profiles = [ "default" ];
    };

    "seanbase" = {
      address = "admin@seanbase.com";
      realName = "Sean";
      imap = {
        host = "imap.porkbun.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.porkbun.com";
        port = 465;
        tls.enable = true;
      };
      userName = "admin@seanbase.com";
      thunderbird.profiles = [ "default" ];
    };

    "chudstop" = {
      address = "chudstop@cock.li";
      realName = "admin";
      imap = {
        host = "mail.cock.li";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "mail.cock.li";
        port = 465;
        tls.enable = true;
      };
      userName = "chudstop@cock.li";
      thunderbird.profiles = [ "default" ];
    };
  };

  home.packages = with pkgs; [
    slack
    zoom-us
  ];
}
