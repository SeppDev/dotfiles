{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-settings-daemon
    gnome-control-center
  ];
  programs.dconf.enable = true;

  services = {
    gnome = {
      gnome-keyring.enable = false;
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = false;
  };

}
