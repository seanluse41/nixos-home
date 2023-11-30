{ config, ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
	"application/pdf" = ["chromium-browser.desktop"];
	"text/html" = ["chromium-browser.desktop"];
	"image/jpeg" = ["feh.desktop"];
	"x-scheme-handler/mailto" = ["chromium-browser.desktop"];
	"default" = ["thunar.desktop"];
    };
  };
}
