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
    (Default "hardware")
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

  # BATTERY / POWER
  powerManagement.enable = false;
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      # CPU_SCALING_GOVERNOR_ON_AC = "performance";
      # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      # CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MAX_PERF_ON_AC = 100;
      # CPU_MIN_PERF_ON_BAT = 0;
      # CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      # START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      # STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      #ALWAYS ON BATTERY
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;
    };
  };

  services.auto-cpufreq = {
    enable = false;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      "sepp" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    tlp
    brightnessctl
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
