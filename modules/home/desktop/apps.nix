{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd

    # qemu_full
    # gparted

    lutris
    bottles
    flatpak
    gnome-software
    gtk4
    tor-browser
    # mangohud

    # speech-denoiser
    # rnnoise
    # rnnoise-plugin
    easyeffects
    vlc
    lunar-client
    audacity
    # qbittorrent
    # rpi-imager
    waypaper
    # monero-gui
    # linux-wallpaperengine

    ventoy-full-qt
  ];

  qt.enable = true;

}
