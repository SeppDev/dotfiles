{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd

    speech-denoiser
    vlc
    lunar-client
    qbittorrent
    brave
    discord
    seahorse
    rpi-imager
    waypaper
    
    flatpak
  ];
}
