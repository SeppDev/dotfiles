# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
let
  systemDir = ../../modules/system;
  Module = name: systemDir + "/${name}.nix";
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    (Module "desktop/hyprland")
    (Module "base")
    (Module "envpath")
    (Module "polkit")
    (Module "bluetooth")
    (Module "network")
    (Module "locale")
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



  qt.enable = true;

  # programs.firefox.enable = true;
  hardware.enableAllFirmware = true;
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 20;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.flatpak.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.sepp = {
    isNormalUser = true;
    description = "sepp";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    # specialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      "sepp" = import ./home.nix;
    };
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    tlp
    brave
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  system.stateVersion = "25.05"; # Did you read the comment?
}
