{ pkgs, ... }:

{
  environment.packages = with pkgs; [ PROGRAM ];

  programs.PROGRAM = {

  };
}
