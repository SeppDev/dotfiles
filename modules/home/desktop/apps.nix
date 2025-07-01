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
    brave
    discord
    seahorse
    rpi-imager
    waypaper
  ];
}
