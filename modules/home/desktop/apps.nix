{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd
    xwayland

    android-studio

    bottles
    flatpak
    gnome-software
    librewolf
    easyeffects
    vlc
    audacity
    waypaper
    networkmanager
    # protonvpn-gui
    loupe
    kdePackages.dolphin
    qbittorrent
    # lunar-client
    # ventoy-full-qt
    # lutris
    # qemu_full
    # gparted
    mangohud
    # linux-wallpaperengine
    # qbittorrent
    # rpi-imager
  ];
}
