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

    code-cursor
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
