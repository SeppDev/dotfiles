{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-settings-daemon
    gnome-control-center
  ];
  programs.dconf.enable = true;

  services = {
    gnome = {
      gnome-keyring.enable = true;
    };
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = true;
  };

}
