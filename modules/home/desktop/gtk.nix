{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gtk4
    gtk3
    gnome-themes-extra
    papirus-icon-theme
    gnome-tweaks
    palenight-theme
    gnomeExtensions.user-themes
  ];

  gtk.enable = true;
}
