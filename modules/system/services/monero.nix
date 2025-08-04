{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xmrig
    # xmrig-mo
  ];
}
