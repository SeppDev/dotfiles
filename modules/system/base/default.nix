{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./envpath.nix
    ./locale.nix
    ./polkit.nix
  ];
}
