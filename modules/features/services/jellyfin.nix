{ self, inputs, ... }: {
  flake.nixosModules.homeServerJellyfin = { ... }: {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

    users.users.jellyfin.extraGroups = [ "video" "render" ];
    networking.firewall.allowedTCPPorts = [ 8096 ];
  };
}