{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd

    bun

    lutris
    bottles
    flatpak

    speech-denoiser
    vlc
    lunar-client
    spotify
    qbittorrent
    discord
    rpi-imager
    waypaper
  ];
}
