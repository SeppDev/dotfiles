{ ... }:
{
  programs.dconf.enable = true;

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gdm.enable = true;
    gnome = {
      gnome-keyring.enable = true;
    };
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

}
