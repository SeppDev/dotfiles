{
  pkgs,
  ...
}:

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
    (Default "boot")
    (Default "security")
    (Default "services")
    (Default "desktop")
    (Module "drivers/nvidia")
  ];

  environment.sessionVariables.HOST = "desktop";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      "user" = import ./home.nix;
    };
  };

  powerManagement.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_6_6;

  # Bootloader.
  boot.initrd.luks.devices."luks-852f4629-c835-45e8-ba9b-7d6906f3597d".device = "/dev/disk/by-uuid/852f4629-c835-45e8-ba9b-7d6906f3597d";
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  # boot = {
  #   loader = {
  #     grub = {
  #       enable = true;
  #       device = "/dev/sdb";
  #       useOSProber = true;
  #     };
  #   };
  # };

  programs = {
    nix-ld.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  # environment.systemPackages = with pkgs; [];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  system.stateVersion = "25.05";
}
