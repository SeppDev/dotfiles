{ ... }:
{
  programs.dconf.enable = true;

  services = {
    gnome = {
      gnome-keyring.enable = true;
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

}
