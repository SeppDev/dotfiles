{ pkgs, ... }:

{
  home.packages = with pkgs; [
    astal.io
    astal.gjs
    astal.tray
    astal.auth
    astal.apps
    astal.river
    astal.mpris
    astal.greet
    astal.notifd
    astal.astal4
    astal.wireplumber
    astal.powerprofiles
    astal.network
    astal.hyprland
    astal.battery
    astal.bluetooth
  ];

}
