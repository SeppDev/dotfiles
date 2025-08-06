{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg-full
    libGL
    libva
    libva-utils
    vaapiVdpau
    libvdpau
    vdpauinfo

    yazi
    fastfetch
    xwayland
    lolcat

    # nil
    nixd
    nixfmt-rfc-style
    nautilus

    # networkmanager

    home-manager
    wl-clipboard
    pavucontrol
    nv-codec-headers
    sxhkd
  ];

  # environment.variables.BROWSER = "firefox";

  home = {
    username = "sepp";
    homeDirectory = "/home/sepp";
    sessionVariables = {
      EDITOR = "zeditor";
      TERMINAL = "bash";
      XCURSOR_SIZE = "32";
      GTK_THEME = "Adwaita-dark";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XCURSOR_THEME = "Adwaita";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      QML2_IMPORT_PATH = "${pkgs.quickshell}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
      # QML2_IMPORT_PATH = "${pkgs.quickshell}/lib/qt-6/qml:${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml";
      # QT_QML_GENERATE_QMLLS_INI = "ON";
    };

    file.".config/quicskhell" = {
      source = ../../../config/quickshell;
      recursive = true;
    };

    file.".config/hypr" = {
      source = ../../../config/hypr;
      recursive = true;
    };

    file.".config/home-manager" = {
      source = ../../../config/home-manager;
      recursive = true;
    };
  };
}
