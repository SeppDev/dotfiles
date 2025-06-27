{ pkgs, ... }:

{
  home.packages = with pkgs; [ PROGRAM ];

  programs.PROGRAM = {

  };
}
