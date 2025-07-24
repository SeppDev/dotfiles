{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.wallpaper-engine-plugin
  ];

  services = {
    desktopManager.plasma6.enable = true;
  };
}
