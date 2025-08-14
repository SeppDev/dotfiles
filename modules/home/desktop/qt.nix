{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qt6.full
  ];

  qt.enable = true;
}
