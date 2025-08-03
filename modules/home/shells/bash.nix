{ pkgs, ... }:

{
  home.packages = with pkgs; [ bash ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      dotfiles = "cd ~/dotfiles ; hx";
      zed = "zeditor";
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#$HOST --impure ; home-manager switch";
      rebuild-update = "sudo nix flake update --flake ~/dotfiles && rebuild";
      rollback = "sudo nixos-rebuild switch --rollback";
    };
  };
}
