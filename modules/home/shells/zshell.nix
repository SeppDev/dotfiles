{ pkgs, ... }:

{
  home.packages = with pkgs; [ zsh ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # histSize = 5000;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#$HOST --impure";
    };
  };
}
