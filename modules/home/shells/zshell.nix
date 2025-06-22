{ pkgs, ... }:

{
  home.packages = with pkgs; [ zsh ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # ohMyZsh = {
    # enable = true;
    # };
    # histSize = 5000;
    # shellInit = "fastfetch ;";
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#$HOST --impure";
    };
  };
}
