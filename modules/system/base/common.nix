{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    wget
    accountsservice

    libva
    libvdpau
    vdpauinfo

    nv-codec-headers-12

    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
  ];

  nixpkgs.config = {
    acceptLicense = true;
    allowUnfree = true;
  };

  programs = {
    firefox.enable = true;
  };

  services = {
    printing.enable = true;
  };

  security = {
    rtkit.enable = true;
    sudo.enable = false;
    sudo-rs.enable = true;
    # pam.services.hyprland.enableGnomeKeyring = true;
  };

  environment.variables.PATH = [ "$HOME/.cargo/bin" ];

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
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
