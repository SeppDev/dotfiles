{ pkgs, ... }:

{
  home.packages = with pkgs; [ fuzzel ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        terminal = "foot";
        width = 50;
        lines = 10;
        layer = "overlay";
        anchor = "center";
        exit-on-keyboard-focus-loss = true;
        exit-on-unfocus = true;
      };
      colors = {
        background = "282828dd";
        text = "ffffff";
        match = "89b4fa";
        selection = "1e1e2e";
        selection-text = "ffffff";
        border = "89b4fa";
      };
    };
  };
}
