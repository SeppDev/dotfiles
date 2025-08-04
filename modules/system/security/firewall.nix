{ ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 7889 ];
    allowedUDPPorts = [ 7884 ];
  };
}
