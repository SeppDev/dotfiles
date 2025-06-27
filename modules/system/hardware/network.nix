{ pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    # nameservers = [ "194.242.2.9" ];
    # resolvconf.enable = false;
    networkmanager = {
      enable = true;
      # dns = "none";
    };
  };

  services.resolved = {
    enable = true;
    dnsovertls = "true";
    dnssec = "false";
    llmnr = "true";
    domains = [
      "~"
    ];
    extraConfig = ''
      DNS=194.242.2.6#family.dns.mullvad.net
    '';
  };
}
