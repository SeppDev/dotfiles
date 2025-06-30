{ pkgs, ... }:
{
  # environment.systemPackages = with pkgs; [
  #   quickshell
  # ];

  home.packages = with pkgs; [
    qt6.full
    qt6.qtdeclarative
    qt6.qtbase
    qt6.qtlanguageserver
    qtcreator
    quickshell
  ];
}
