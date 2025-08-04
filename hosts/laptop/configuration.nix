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
    (Module "battery")
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

  boot.initrd.luks.devices."luks-09569b80-0fb2-4ef9-99c7-52e5c1360f8e".device =
    "/dev/disk/by-uuid/09569b80-0fb2-4ef9-99c7-52e5c1360f8e";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      "sepp" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
