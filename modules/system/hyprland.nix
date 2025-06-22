{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland
    hypridle
    hyprlock
    hyprsunset
    hyprcursor
    hyprshot
    hyprcursor
    rose-pine-hyprcursor
  ];

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };

}
