{ pkgs, ... }:

{
  home.packages = with pkgs; [ bash ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      zed = "zeditor";
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#$HOST --impure";
      rollback = "sudo nixos-rebuild switch --rollback";
    };
  };
}
