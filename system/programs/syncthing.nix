{
# !!! WARNING !!!
# This is used by NixOS and not by Home-manager

# Syncthing ports: 8384 for remote access to GUI
# 22000 TCP and/or UDP for sync traffic
# 21027/UDP for discovery
# source: https://docs.syncthing.net/users/firewall.html
networking.firewall.allowedTCPPorts = [ 8384 22000 ];
networking.firewall.allowedUDPPorts = [ 22000 21027 ];

services.syncthing = {
    enable = true;
    user = "ugo";
#    dataDir = "/home/myusername/Documents";
    configDir = "/home/ugo/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "ugo-mobile" = { id = "C4IUGFF-AOMMHQP-Q5EPLAM-7W6FKV4-GE54CIU-7YV6C3X-SYBBLIV-B3AWWQ2"; };
      };
      folders = {
        "Documents" = {         # Name of folder in Syncthing, also the folder ID
          id = "n4cvk-zbf4j";
          path = "/home/ugo/Documents";    # Which folder to add to Syncthing
          devices = [ "ugo-mobile" ];      # Which devices to share the folder with
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "14";
          };
        };
        "Pictures" = {         # Name of folder in Syncthing, also the folder ID
          id = "k4ffh-15zek";
          path = "/home/ugo/Pictures";    # Which folder to add to Syncthing
          devices = [ "ugo-mobile" ];      # Which devices to share the folder with
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "14";
          };
        };
        "Downloads" = {         # Name of folder in Syncthing, also the folder ID
          id = "sbxzi-nq6q5";
          path = "/home/ugo/Downloads";    # Which folder to add to Syncthing
          devices = [ "ugo-mobile" ];      # Which devices to share the folder with
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "14";
          };
        };
      };
    };
  };
}
