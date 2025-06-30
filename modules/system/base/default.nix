{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./locale.nix
    ./polkit.nix
    ./user.nix
  ];
}
