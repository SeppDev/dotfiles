# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/system/hyprland.nix
  ];

  environment.variables = {
    HOST = "laptop";
  };

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  boot.initrd.luks.devices."luks-09569b80-0fb2-4ef9-99c7-52e5c1360f8e".device =
    "/dev/disk/by-uuid/09569b80-0fb2-4ef9-99c7-52e5c1360f8e";

  environment.variables.PATH = [ "$HOME/.cargo/bin" ];

  nixpkgs.config = {
    acceptLicense = true;
    allowUnfree = true;
  };

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

  time.timeZone = "Europe/Amsterdam";
  i18n.extraLocaleSettings = {
    defaultLocale = "en_US.UTF-8";
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
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

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  environment.systemPackages = with pkgs; [
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
