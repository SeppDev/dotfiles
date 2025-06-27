{
  config,
  pkgs,
  ...
}:

let
  systemDir = ../../modules/system;
  Module = name: systemDir + "/${name}.nix";
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    (Module "desktop/hyprland")
    (Module "envpath")
    (Module "polkit")
    (Module "bluetooth")
    (Module "common")
    (Module "network")
  ];

  environment.sessionVariables.HOST = "desktop";

  users.users.sepp = {
    isNormalUser = true;
    description = "sepp";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config = {
    acceptLicense = true;
    allowUnfree = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      "sepp" = import ./home.nix;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_6_6;

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

  # Bootloader.
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sdb";
        useOSProber = true;
      };
    };
  };

  hardware = {
    xpadneo.enable = true;
    enableAllFirmware = true;

    graphics = {
      enable = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  boot.initrd.kernelModules = [
    "usbhid"
    "joydev"
    "xpad"
  ];

  services = {
    xserver = {
      enable = true;
      dpi = 300;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [ "nvidia" ];
    };
    libinput.enable = true;
    displayManager = {
      gdm.enable = true;
      # sddm.enable = true;
    };
    desktopManager = {
      gnome.enable = true;
      plasma6.enable = false;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };
    printing.enable = true;
    flatpak.enable = true;
    gnome = {
      gnome-keyring.enable = true;
    };
  };

  programs = {
    nix-ld.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
    firefox.enable = true;
    dconf.enable = true;
    niri.enable = true;
    noisetorch.enable = true;
    hyprland = {
      enable = true;
      withUWSM = false;
      xwayland.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    helix
    wget
    bun
    gcc
    clang
    rnnoise
    rnnoise-plugin
    speech-denoiser
    noisetorch
    easyeffects
    wl-clipboard
    lutris
    bottles
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
