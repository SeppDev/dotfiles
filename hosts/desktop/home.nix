{ pkgs, ... }:

let
  homeDir = ../../modules/home;
  Module = name: homeDir + "/${name}.nix";
in
{
  imports = [
    (Module "git")
    (Module "prefer-dark")
    (Module "common")

    (Module "starship")
    (Module "shells/bash")
    (Module "zoxide")

    (Module "terminals/kitty")
    (Module "services/syncthing")
    (Module "editors/zed-editor")
    (Module "editors/helix")
  ];

  home.packages = with pkgs; [
    rustup
    zoxide
    rpi-imager
    altus
    seahorse
    vlc
    clangStdenv
    waypaper
    fastfetch
    home-manager
    qbittorrent
    cmake

    gtk4
    nodejs
    typescript
    papirus-icon-theme

    # nixd
    nil
    nixfmt-rfc-style

    nv-codec-headers-12

    gobject-introspection
    libsoup_3
    gtksourceview5
    accountsservice
    gtksourceview

    discord
    nvtopPackages.full
    libsForQt5.qt5ct

    sxhkd

    obs-studio
    obs-studio-plugins.obs-websocket
    obs-cmd

    speech-denoiser
    libva
    libvdpau
    vdpauinfo

    ffmpeg-full
    x265
    spotify
    flatpak
    ags
    pavucontrol
    kitty
    brave
    lolcat
    fuzzel
    xdg-desktop-portal-hyprland
    wl-clipboard
    lunar-client
    # gnome-themes-extra

    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
