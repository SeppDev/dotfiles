{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd

    lutris
    bottles
    flatpak
    gnome-software
    gtk4
    librewolf
    easyeffects
    vlc
    lunar-client
    audacity
    waypaper
    ventoy-full-qt
    # qemu_full
    # gparted
    # mangohud
    # linux-wallpaperengine
    # qbittorrent
    # rpi-imager
  ];

  qt.enable = true;

}
