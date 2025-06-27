{ pkgs, ... }:

{
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
}
