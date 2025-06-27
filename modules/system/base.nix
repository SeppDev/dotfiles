{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    wget
    wl-clipboard
  ];

  nixpkgs.config = {
    acceptLicense = true;
    allowUnfree = true;
  };

  security = {
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

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
