{ ... }:

let
  homeDir = ../../modules/home;
  # Module = name: homeDir + "/${name}.nix";
  Default = name: homeDir + "/${name}/default.nix";
in
{
  imports = [
    (Default "base")
    (Default "desktop")
    (Default "terminals")
    (Default "editors")
    (Default "launchers")
    (Default "shells")
    (Default "services")
  ];

  # home.packages = with pkgs; [ ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
