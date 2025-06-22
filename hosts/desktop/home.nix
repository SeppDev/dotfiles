{ pkgs, ... }:

let
  homeDir = ../../modules/home;
  Module = name: homeDir + "/${name}.nix";
in
{
  imports = [
    (Module "git")
    (Module "prefer-dark")

    (Module "starship")
    (Module "shells/bash")
    (Module "zoxide")

    (Module "terminals/kitty")
    (Module "services/syncthing")
    (Module "editors/zed-editor")
    (Module "editors/helix")
  ];

  home = {
    username = "sepp";
    homeDirectory = "/home/sepp";
    pointerCursor = {
      name = "rose-pine";
      package = pkgs.rose-pine-hyprcursor;
      size = 32;
      gtk.enable = true;
    };
    sessionPath = [
      "$HOME/.cargo/bin"
    ];
    sessionVariables = {
      EDITOR = "zeditor";
      XCURSOR_SIZE = "32";
      GTK_THEME = "Adwaita-dark";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XCURSOR_THEME = "Adwaita";
      GDK_BACKEND = "wayland,x11";
    };
    file.".config/hypr" = {
      source = ../../config/hypr;
      recursive = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.packages = with pkgs; [
    rustup
    zoxide
    rpi-imager
    altus
    seahorse
    vlc
    clangStdenv
    waypaper
    hyprpaper
    fastfetch
    home-manager
    # fastfetch
    # astal.io
    # astal.gjs
    # astal.tray
    # astal.auth
    # astal.apps
    # astal.river
    # astal.mpris
    # astal.greet
    # astal.notifd
    # astal.astal4
    # astal.wireplumber
    # astal.powerprofiles
    # astal.network
    # astal.hyprland
    # astal.battery
    # astal.bluetooth
    gtk4
    nodejs
    typescript
    polkit_gnome
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

    libva
    libvdpau
    vdpauinfo
    home-manager

    ffmpeg-full
    x265
    spotify
    flatpak
    ags
    bluez
    blueman
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
