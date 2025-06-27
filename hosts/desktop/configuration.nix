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
    (Module "base")
    (Module "xpadneo")
    (Module "nvidia")
    (Module "envpath")
    (Module "polkit")
    (Module "bluetooth")
    (Module "network")
    (Module "locale")
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
    enableAllFirmware = true;
    graphics.enable = true;
  };

  services = {
    libinput.enable = true;
    displayManager = {
      gdm.enable = true;
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
  };

  environment.systemPackages = with pkgs; [
    bun
    gcc
    clang
    rnnoise
    rnnoise-plugin
    speech-denoiser
    noisetorch
    easyeffects
    lutris
    bottles
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  system.stateVersion = "25.05";

}
