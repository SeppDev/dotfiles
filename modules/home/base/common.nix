{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
    ninja
    just

    clangStdenv
    clang

    python3Full
    pipx
    # python313Packages.pip

    # nodejs
    # typescript
    rustup

    fastfetch
    lolcat

    gtk4

    # nil
    nixd
    nixfmt-rfc-style

    home-manager
    wl-clipboard
    pavucontrol
    ffmpeg-full
    sxhkd
  ];

  home = {
    username = "sepp";
    homeDirectory = "/home/sepp";
    sessionVariables = {
      EDITOR = "zeditor";
      XCURSOR_SIZE = "32";
      GTK_THEME = "Adwaita-dark";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XCURSOR_THEME = "Adwaita";
      GDK_BACKEND = "wayland,x11";
      # QML2_IMPORT_PATH = "${pkgs.quickshell}/lib/qt-6/qml:${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml";
      QML2_IMPORT_PATH = "${pkgs.quickshell}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
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
  };
}
