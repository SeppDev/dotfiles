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
    (Module "hyprland")
  ];

  environment.sessionVariables = {
    HOST = "desktop";
  };

  users.users.sepp = {
    isNormalUser = true;
    description = "sepp";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.variables.PATH = [ "$HOME/.cargo/bin" ];

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

  networking = {
    hostName = "desktop";
    # nameservers = [ "194.242.2.9" ];
    # resolvconf.enable = false;
    networkmanager = {
      enable = true;
      # dns = "none";
    };
  };

  hardware = {
    xpadneo.enable = true;
    enableAllFirmware = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

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
    resolved = {
      enable = true;
      dnsovertls = "true";
      dnssec = "false";
      llmnr = "true";
      domains = [
        "~"
      ];
      extraConfig = ''
        DNS=194.242.2.6#family.dns.mullvad.net
      '';
    };
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

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo.enable = false;
    sudo-rs.enable = true;
    pam.services.hyprland.enableGnomeKeyring = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  environment.systemPackages = with pkgs; [
    helix
    wget
    polkit
    bun
    gcc
    clang
    rnnoise
    rnnoise-plugin
    speech-denoiser
    noisetorch
    easyeffects
    # protonup
    lutris
    bottles
  ];

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
