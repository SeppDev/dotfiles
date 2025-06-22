{ pkgs, ... }:

let
  homeDir = ../../modules/home;
  Module = name: homeDir + "/${name}.nix";
in
{
  imports = [
    (Module "git")
    (Module "prefer-dark")

    (Module "shells/bash")
    (Module "starship")
    (Module "zoxide")

    (Module "terminals/kitty")
    (Module "services/syncthing")
    (Module "editors/zed-editor")
    (Module "editors/helix")
  ];

  home = {
    username = "sepp";
    homeDirectory = "/home/sepp";
  };

  # home.file.".config/hypr" = {
  #   source = ../../config/hypr;
  #   recursive = true;
  # };

  xdg.configFile."hypr".source = ../../config/hypr;

  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XCURSOR_THEME = "Adwaita";
    GDK_BACKEND = "wayland,x11";
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wl-clipboard

    zoxide
    rpi-imager
    seahorse
    waypaper
    fastfetch
    home-manager
    fastfetch
    gtk4
    nodejs
    typescript
    rustup
    polkit_gnome
    papirus-icon-theme
    gtk4
    clangStdenv

    nil
    nixfmt-rfc-style

    gobject-introspection
    libsoup_3
    gtksourceview5
    accountsservice
    gtksourceview

    discord
    nvtopPackages.full
    libsForQt5.qt5ct

    sxhkd

    libva
    libvdpau
    vdpauinfo

    ffmpeg-full
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

    gcc

    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
