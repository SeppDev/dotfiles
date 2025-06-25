{ pkgs, ... }:

{
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
      QML2_IMPORT_PATH = "$HOME/.config/quickshell";
      QT_QML_GENERATE_QMLLS_INI = "on";
    };
    file.".config/hypr" = {
      source = ../../config/hypr;
      recursive = true;
    };
  };
}
