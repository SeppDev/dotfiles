{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprlang
    hyprland
    hyprpaper
    hyprpolkitagent
    hypridle
    hyprlock
    hyprsunset
    hyprcursor
    hyprshot
    hyprcursor
    rose-pine-hyprcursor
    xdg-desktop-portal-hyprland
  ];

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };

}
