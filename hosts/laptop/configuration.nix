# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
let
  systemDir = ../../modules/system;
  Module = name: systemDir + "/${name}.nix";
  Default = name: systemDir + "/${name}/default.nix";
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    (Default "base")
    (Module "hardware/battery")
    (Default "hardware")
    (Default "boot")
    (Default "services")
    (Default "security")
    (Default "desktop")
  ];

  environment.sessionVariables.HOST = "laptop";

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      "user" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
