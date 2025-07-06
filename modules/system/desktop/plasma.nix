{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  services = {
    desktopManager.plasma6.enable = true;
  };
}
