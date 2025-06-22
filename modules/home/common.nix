{ pkgs, ... }:

{
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
}
