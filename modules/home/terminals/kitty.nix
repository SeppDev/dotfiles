{ pkgs, ... }:

{
  home.packages = with pkgs; [ kitty ];

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.7";
      background_blur = 0;
    };
  };
}
