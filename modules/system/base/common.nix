{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake
    ninja
    just
    buildPackages.gcc
    buildPackages.binutils
    vulkan-tools

    clangStdenv
    clang
    rustup
    helix
    wget
    accountsservice
    bun
    htop
    btop
    libavif
    gparted

    android-udev-rules
    android-tools

    xdg-utils

    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
  ];

  services.udev.packages = with pkgs; [ android-udev-rules ];

  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_15;

  nixpkgs.config = {
    acceptLicense = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "ventoy-qt5-1.1.05"
    ];
  };

  programs = {
    adb.enable = true;
    firefox.enable = true;
    dconf.enable = true;
  };

  services = {
    dbus.enable = true;
    printing.enable = true;
    accounts-daemon.enable = true;
  };

  security = {
    rtkit.enable = true;
    sudo.enable = false;
    sudo-rs.enable = true;
    pam.services.plasma6.kwallet.enable = true;
  };

  environment.variables.PATH = [
    "$HOME/.cargo/bin"
    "$HOME/.bun/bin"
  ];

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

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-dbus-proxy
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
      xdg-desktop-portal-hyprland
      # kdePackages.xdg-desktop-portal-kde
    ];
  };
}
