{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = with pkgs; {
      topBar = {
    layer = "top";
    position = "top";
    mod = "dock";
    exclusive = true;
    passthrough = false;
    gtk-layer-shell = true;
    height = 34;
    modules-left = [
        "clock"
        "custom/weather"
        "hyprland/workspaces"
    ];
    modules-center = [
        "hyprland/window"
    ];
    modules-right = [
        "tray"
	"temperature"
        "custom/updates"
#        "hyprland/language"
        "wireplumber"
    ];

    hyprland-window = {
	format = "{}";
    };    
    hyprland-workspaces = {
        disable-scroll = true;
        all-outputs = true;
        on-click = "activate";
        format = "{icon}";
        persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
        };
    };
   custom-weather = {
        tooltip = true;
        format = "{}";
        interval = 30;
        exec = "~/.config/waybar/scripts/waybar-wttr.py";
        return-type = "json";
    };

    cpu = {
        format = "{usage}% ";
        tooltip = false;
    };

    temperature = {
        thermal-zone = 2;
        hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
        critical-threshold = 80;
        format-critical = "{temperatureC}°C {icon}";
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" ""];
    };

    hyprland-language = {
	format = "{}";
	format-ja = "ENG";
	format-mozc = "あ";
    };

    tray = {
        icon-size = 13;
        spacing = 10;
    };
    clock = {
        format = "{: %R   %d/%m}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };
    wireplumber = {
        format = "{volume}% {icon}";
        format-muted = "";
    };
};
    };
  };
}
