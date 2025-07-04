{ pkgs, ... }:

{
  home.packages = with pkgs; [ zoxide ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
