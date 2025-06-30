{ pkgs, ... }:

{
  home.packages = with pkgs [
    cmake
    ninja
    just

    clangStdenv
    clang
    gcc

    # nodejs
    # typescript
    rustup

    fastfetch
    lolcat

    gtk4

    nil
    nixfmt-rfc-style

    home-manager
    wl-clipboard
    pavucontrol
    ffmpeg-full
    sxhkd
  ];

  environment.variables.PATH = [ "$HOME/.cargo/bin" ];

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
  };
}
