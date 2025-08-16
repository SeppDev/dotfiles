{ pkgs, ... }:
{
  qt.enable = true;

  home.packages = with pkgs; [
    qt6.full
    qt6.qtdeclarative
    qt6.qtlanguageserver
    qt6.qttools
    qt6.qtbase
    qt5.full
    libsForQt5.qtgraphicaleffects
    quickshell
  ];
}
