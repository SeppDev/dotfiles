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
    # linux-wallpaperengine

    # ventoy-full-qt
  ];

}
