{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd

    bottles
    flatpak
    gnome-software
    gtk4
    librewolf
    easyeffects
    vlc
    audacity
    waypaper
    # lunar-client
    # ventoy-full-qt
    # lutris
    # qemu_full
    # gparted
    # mangohud
    # linux-wallpaperengine
    # qbittorrent
    # rpi-imager
  ];

  qt.enable = true;

}
