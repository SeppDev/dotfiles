{ ... }:
{
  services.tor = {
    enable = true;
    relay.enable = false;
    openFirewall = true;
    enableGeoIP = true;
    settings = {
      SOCKSPort = [ 9063 ];
      ExitNodes = "{nl}";      
      StrictNodes = true;
      # UseBridges = true;
      # ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      # Bridge = "obfs4 IP:ORPort [fingerprint]";
    };
    client = {
      enable = true;
    };
  };

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
